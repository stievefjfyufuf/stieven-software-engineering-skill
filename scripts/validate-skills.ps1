param(
    [string]$Root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
)

$ErrorActionPreference = 'Stop'

$skillsDir = Join-Path $Root 'skills'
$readmePath = Join-Path $Root 'README.md'
$examplesDir = Join-Path $Root 'examples/campus-inventory'
$errors = New-Object System.Collections.Generic.List[string]

if (-not (Test-Path $skillsDir)) {
    throw "Missing skills directory: $skillsDir"
}

if (-not (Test-Path $readmePath)) {
    throw "Missing README.md"
}

foreach ($rootFile in @('LICENSE', 'CHANGELOG.md', 'CONTRIBUTING.md')) {
    $path = Join-Path $Root $rootFile
    if (-not (Test-Path $path)) {
        $errors.Add("Missing root project file: $rootFile.")
    }
}

$skills = Get-ChildItem $skillsDir -Directory | Sort-Object Name
if ($skills.Count -ne 16) {
    $errors.Add("Expected 16 skill folders, found $($skills.Count).")
}

$requiredSkillSections = @(
    '## Purpose',
    '## Skill Docs',
    '## Inputs',
    '## Workflow',
    '## Output',
    '## Handoff',
    '## Quality Rules'
)

$requiredDocSections = @(
    '## When To Use',
    '## Required Inputs',
    '## Step Procedure',
    '## Output Template',
    '## Traceability IDs',
    '## Mini Example',
    '## Quality Checklist',
    '## Handoff',
    '## Common Mistakes To Avoid'
)

$requiredAgentKeys = @(
    'interface:',
    'display_name:',
    'short_description:',
    'default_prompt:'
)

foreach ($skill in $skills) {
    $skillPath = Join-Path $skill.FullName 'SKILL.md'
    $docsPath = Join-Path $skill.FullName 'references/skill-docs.md'
    $agentPath = Join-Path $skill.FullName 'agents/openai.yaml'

    foreach ($path in @($skillPath, $docsPath, $agentPath)) {
        if (-not (Test-Path $path)) {
            $errors.Add("$($skill.Name): missing $([IO.Path]::GetFileName($path)).")
        }
    }

    if (Test-Path $skillPath) {
        $text = Get-Content $skillPath -Raw
        if ($text -notmatch '(?s)^---\s*\r?\nname:\s*([^\r\n]+)\r?\ndescription:\s*([^\r\n]+)\r?\n---') {
            $errors.Add("$($skill.Name): invalid SKILL.md front matter.")
        }
        elseif ($Matches[1].Trim() -ne $skill.Name) {
            $errors.Add("$($skill.Name): front matter name does not match folder.")
        }

        foreach ($section in $requiredSkillSections) {
            if ($text -notmatch [regex]::Escape($section)) {
                $errors.Add("$($skill.Name): SKILL.md missing $section.")
            }
        }

        if ($text -notmatch 'Before producing this skill''s artifact, read `references/skill-docs\.md`') {
            $errors.Add("$($skill.Name): SKILL.md must require reading references/skill-docs.md before producing output.")
        }
    }

    if (Test-Path $docsPath) {
        $docs = Get-Content $docsPath -Raw
        foreach ($section in $requiredDocSections) {
            if ($docs -notmatch [regex]::Escape($section)) {
                $errors.Add("$($skill.Name): references/skill-docs.md missing $section.")
            }
        }
    }

    if (Test-Path $agentPath) {
        $agent = Get-Content $agentPath -Raw
        foreach ($key in $requiredAgentKeys) {
            if ($agent -notmatch [regex]::Escape($key)) {
                $errors.Add("$($skill.Name): agents/openai.yaml missing $key.")
            }
        }

        if ($agent -notmatch 'references/skill-docs\.md') {
            $errors.Add("$($skill.Name): agents/openai.yaml default_prompt should require reading references/skill-docs.md.")
        }

        $promptMatch = [regex]::Match($agent, '(?s)default_prompt:\s*(.*)$')
        if ($promptMatch.Success) {
            $promptText = $promptMatch.Groups[1].Value.Trim()
            if ($promptText.Length -lt 180) {
                $errors.Add("$($skill.Name): agents/openai.yaml default_prompt is too shallow; expected at least 180 characters.")
            }
        }
    }
}

$readme = Get-Content $readmePath -Raw
$registeredPrefixes = [regex]::Matches($readme, '\| `([A-Z]+)` \|') | ForEach-Object { $_.Groups[1].Value } | Sort-Object -Unique
$usedPrefixes = New-Object System.Collections.Generic.HashSet[string]

Get-ChildItem $skillsDir -Recurse -Include *.md | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    [regex]::Matches($content, '\b([A-Z]+)-###\b|\b([A-Z]+)-\d{3}\b') | ForEach-Object {
        $prefix = if ($_.Groups[1].Success) { $_.Groups[1].Value } else { $_.Groups[2].Value }
        [void]$usedPrefixes.Add($prefix)
    }
}

foreach ($prefix in ($usedPrefixes | Sort-Object)) {
    if ($registeredPrefixes -notcontains $prefix) {
        $errors.Add("README traceability table missing prefix $prefix.")
    }
}

if (-not (Test-Path $examplesDir)) {
    $errors.Add("Missing examples/campus-inventory directory.")
}
else {
    $expectedExampleFiles = @(
        'README.md',
        '01-inception.md',
        '02-elicitation.md',
        '03-specification.md',
        '04-prioritization.md',
        '05-validation-change.md',
        '06-architecture-design.md',
        '07-database-api-design.md',
        '08-ui-design.md',
        '09-issue-planning.md',
        '10-implementation.md',
        '11-code-review.md',
        '12-test-planning.md',
        '13-automated-testing.md',
        '14-acceptance-testing.md',
        '15-deployment.md',
        '16-change-request.md'
    )

    foreach ($file in $expectedExampleFiles) {
        $path = Join-Path $examplesDir $file
        if (-not (Test-Path $path)) {
            $errors.Add("examples/campus-inventory missing $file.")
        }
        elseif ((Get-Content $path -Raw).Trim().Length -lt 80) {
            $errors.Add("examples/campus-inventory/$file is too small to be a useful example.")
        }
    }

    $examplePrefixes = New-Object System.Collections.Generic.HashSet[string]
    Get-ChildItem $examplesDir -Filter *.md | ForEach-Object {
        $content = Get-Content $_.FullName -Raw
        if ($content -match '(?i)\b(TODO|TBD|FIXME|placeholder|coming soon)\b') {
            $errors.Add("examples/campus-inventory/$($_.Name) contains unfinished placeholder text.")
        }

        [regex]::Matches($content, '\b([A-Z]+)-\d{3}\b') | ForEach-Object {
            [void]$examplePrefixes.Add($_.Groups[1].Value)
        }
    }

    foreach ($prefix in ($examplePrefixes | Sort-Object)) {
        if ($registeredPrefixes -notcontains $prefix) {
            $errors.Add("Example uses unregistered traceability prefix $prefix.")
        }
    }

    $requiredExamplePrefixes = @('GOAL','STK','NEED','REQ','AC','DEC','VAL','ADR','COMP','DATA','API','UI','ISSUE','TEST','UAT','REL','CR')
    foreach ($prefix in $requiredExamplePrefixes) {
        if (-not $examplePrefixes.Contains($prefix)) {
            $errors.Add("Example does not demonstrate required prefix $prefix.")
        }
    }
}

if ($errors.Count -gt 0) {
    Write-Host "Skill validation failed:" -ForegroundColor Red
    foreach ($validationError in $errors) {
        Write-Host "- $validationError" -ForegroundColor Red
    }
    exit 1
}

Write-Host "Skill validation passed for $($skills.Count) skills." -ForegroundColor Green
