param(
    [string]$Root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
)

$ErrorActionPreference = 'Stop'

$skillsDir = Join-Path $Root 'skills'
$readmePath = Join-Path $Root 'README.md'
$errors = New-Object System.Collections.Generic.List[string]

if (-not (Test-Path $skillsDir)) {
    throw "Missing skills directory: $skillsDir"
}

if (-not (Test-Path $readmePath)) {
    throw "Missing README.md"
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

if ($errors.Count -gt 0) {
    Write-Host "Skill validation failed:" -ForegroundColor Red
    foreach ($validationError in $errors) {
        Write-Host "- $validationError" -ForegroundColor Red
    }
    exit 1
}

Write-Host "Skill validation passed for $($skills.Count) skills." -ForegroundColor Green
