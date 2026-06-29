param(
    [string]$Root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
)

$ErrorActionPreference = 'Stop'

$skillsDir = Join-Path $Root 'skills'
$readmePath = Join-Path $Root 'README.md'
$examplesDir = Join-Path $Root 'examples/campus-inventory'
$errors = New-Object System.Collections.Generic.List[string]

function Get-TraceIds {
    param(
        [string]$Path,
        [string[]]$Prefixes = @()
    )

    if (-not (Test-Path $Path)) {
        return @()
    }

    $content = Get-Content $Path -Raw
    $ids = [regex]::Matches($content, '\b([A-Z]+)-\d{3}\b') | ForEach-Object { $_.Value }
    if ($Prefixes.Count -gt 0) {
        $ids = $ids | Where-Object { $Prefixes -contains $_.Split('-')[0] }
    }

    return @($ids | Sort-Object -Unique)
}

function Add-MissingTraceErrors {
    param(
        [string]$SourcePath,
        [string]$TargetPath,
        [string[]]$Prefixes,
        [string]$Label,
        [System.Collections.Generic.List[string]]$ErrorList
    )

    $sourceIds = Get-TraceIds -Path $SourcePath -Prefixes $Prefixes
    $targetIds = Get-TraceIds -Path $TargetPath -Prefixes $Prefixes
    foreach ($id in $sourceIds) {
        if ($targetIds -notcontains $id) {
            $ErrorList.Add("$Label missing upstream traceability ID $id.")
        }
    }
}

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

$expectedSkillNames = @(
    '01-se-inception-stakeholder',
    '02-se-elicitation',
    '03-se-specification',
    '04-se-prioritization',
    '05-se-validation-change',
    '06-se-architecture-design',
    '07-se-database-api-design',
    '08-se-ui-design',
    '09-se-issue-planning',
    '10-se-implementation',
    '11-se-code-review',
    '12-se-test-planning',
    '13-se-automated-testing',
    '14-se-acceptance-testing',
    '15-se-deployment',
    '16-se-change-log-engineering-loop'
)

$actualSkillNames = @($skills | ForEach-Object { $_.Name })
foreach ($expectedSkillName in $expectedSkillNames) {
    if ($actualSkillNames -notcontains $expectedSkillName) {
        $errors.Add("Missing or renamed numbered skill folder: $expectedSkillName.")
    }
}
foreach ($actualSkillName in $actualSkillNames) {
    if ($expectedSkillNames -notcontains $actualSkillName) {
        $errors.Add("Unexpected skill folder: $actualSkillName.")
    }
}

$expectedArtifactSnippets = @{}
for ($step = 1; $step -le 15; $step++) {
    $skillName = $expectedSkillNames[$step - 1]
    $artifactStem = switch ($step) {
        1 { 'inception' }
        2 { 'elicitation' }
        3 { 'specification' }
        4 { 'prioritization' }
        5 { 'validation-change' }
        6 { 'architecture-design' }
        7 { 'database-api-design' }
        8 { 'ui-design' }
        9 { 'issue-planning' }
        10 { 'implementation' }
        11 { 'code-review' }
        12 { 'test-planning' }
        13 { 'automated-testing' }
        14 { 'acceptance-testing' }
        15 { 'deployment' }
    }
    $expectedArtifactSnippets[$skillName] = @("docs/software-engineering/$('{0:d2}' -f $step)-$artifactStem.md")
}
$expectedArtifactSnippets['16-se-change-log-engineering-loop'] = @(
    'docs/software-engineering/16-change-request.md',
    'docs/software-engineering/changes/CR-###.md'
)

$expectedUpstreamArtifacts = @{
    '01-se-inception-stakeholder' = @()
    '02-se-elicitation' = @('docs/software-engineering/01-inception.md')
    '03-se-specification' = @('docs/software-engineering/01-inception.md', 'docs/software-engineering/02-elicitation.md')
    '04-se-prioritization' = @('docs/software-engineering/01-inception.md', 'docs/software-engineering/03-specification.md')
    '05-se-validation-change' = @('docs/software-engineering/02-elicitation.md', 'docs/software-engineering/03-specification.md', 'docs/software-engineering/04-prioritization.md')
    '06-se-architecture-design' = @('docs/software-engineering/03-specification.md', 'docs/software-engineering/05-validation-change.md')
    '07-se-database-api-design' = @('docs/software-engineering/03-specification.md', 'docs/software-engineering/05-validation-change.md', 'docs/software-engineering/06-architecture-design.md')
    '08-se-ui-design' = @('docs/software-engineering/03-specification.md', 'docs/software-engineering/04-prioritization.md', 'docs/software-engineering/07-database-api-design.md')
    '09-se-issue-planning' = @('docs/software-engineering/03-specification.md', 'docs/software-engineering/04-prioritization.md', 'docs/software-engineering/05-validation-change.md', 'docs/software-engineering/06-architecture-design.md', 'docs/software-engineering/07-database-api-design.md', 'docs/software-engineering/08-ui-design.md')
    '10-se-implementation' = @('docs/software-engineering/06-architecture-design.md', 'docs/software-engineering/07-database-api-design.md', 'docs/software-engineering/08-ui-design.md', 'docs/software-engineering/09-issue-planning.md')
    '11-se-code-review' = @('docs/software-engineering/09-issue-planning.md', 'docs/software-engineering/10-implementation.md')
    '12-se-test-planning' = @('docs/software-engineering/03-specification.md', 'docs/software-engineering/09-issue-planning.md', 'docs/software-engineering/10-implementation.md', 'docs/software-engineering/11-code-review.md')
    '13-se-automated-testing' = @('docs/software-engineering/10-implementation.md', 'docs/software-engineering/12-test-planning.md')
    '14-se-acceptance-testing' = @('docs/software-engineering/03-specification.md', 'docs/software-engineering/08-ui-design.md', 'docs/software-engineering/12-test-planning.md', 'docs/software-engineering/13-automated-testing.md')
    '15-se-deployment' = @('docs/software-engineering/09-issue-planning.md', 'docs/software-engineering/13-automated-testing.md', 'docs/software-engineering/14-acceptance-testing.md')
    '16-se-change-log-engineering-loop' = @('docs/software-engineering/15-deployment.md', 'docs/software-engineering/16-change-request.md', 'docs/software-engineering/changes/CR-###.md')
}

$requiredSkillSections = @(
    '## Purpose',
    '## Skill Docs',
    '## Inputs',
    '## Required Upstream Artifacts',
    '## Workflow',
    '## Output',
    '## Artifact Persistence',
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

        if ($text -notmatch 'docs/software-engineering/') {
            $errors.Add("$($skill.Name): SKILL.md must define a runtime artifact path under docs/software-engineering/.")
        }

        if ($text -notmatch '(?i)Do not treat a chat response as the final artifact') {
            $errors.Add("$($skill.Name): SKILL.md must state that chat-only output is not the final artifact.")
        }

        if ($text -notmatch '(?i)Reopen (the|both) saved') {
            $errors.Add("$($skill.Name): SKILL.md must require verifying the persisted artifact.")
        }

        if ($text -notmatch '(?i)source of truth') {
            $errors.Add("$($skill.Name): SKILL.md must use the saved artifact as the handoff source of truth.")
        }

        foreach ($artifactSnippet in $expectedArtifactSnippets[$skill.Name]) {
            if ($text -notmatch [regex]::Escape($artifactSnippet)) {
                $errors.Add("$($skill.Name): SKILL.md missing canonical artifact path $artifactSnippet.")
            }
        }

        foreach ($upstreamArtifact in $expectedUpstreamArtifacts[$skill.Name]) {
            if ($text -notmatch [regex]::Escape($upstreamArtifact)) {
                $errors.Add("$($skill.Name): SKILL.md missing required upstream artifact $upstreamArtifact.")
            }
        }

        if ($text -notmatch '(?i)Worked example (chain|output):') {
            $errors.Add("$($skill.Name): SKILL.md must link a worked example output or chain.")
        }

        if ($skill.Name -ne '01-se-inception-stakeholder' -and $text -notmatch '(?i)do not') {
            $errors.Add("$($skill.Name): SKILL.md must define fail-safe behavior when upstream evidence is unavailable.")
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

        foreach ($keyName in @('interface', 'display_name', 'short_description', 'default_prompt')) {
            $keyCount = ([regex]::Matches($agent, "(?m)^\s*$keyName\s*:")).Count
            if ($keyCount -ne 1) {
                $errors.Add("$($skill.Name): agents/openai.yaml must contain exactly one $keyName key; found $keyCount.")
            }
        }

        if ($agent -notmatch 'references/skill-docs\.md') {
            $errors.Add("$($skill.Name): agents/openai.yaml default_prompt should require reading references/skill-docs.md.")
        }

        if ($agent -notmatch 'Artifact Persistence') {
            $errors.Add("$($skill.Name): agents/openai.yaml default_prompt should require persisted artifact handling.")
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
if ($readme -notmatch [regex]::Escape('~/.agents/skills')) {
    $errors.Add('README install instructions must include the current user skill path ~/.agents/skills.')
}
if ($readme -notmatch [regex]::Escape('<repo>/.agents/skills')) {
    $errors.Add('README install instructions must include the repository skill path <repo>/.agents/skills.')
}
if ($readme -match '(?i)\.codex[/\\]skills') {
    $errors.Add('README install instructions contain the legacy .codex/skills path; use .agents/skills.')
}
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

    for ($step = 1; $step -le 16; $step++) {
        $exampleFile = $expectedExampleFiles[$step]
        $examplePath = Join-Path $examplesDir $exampleFile
        if (Test-Path $examplePath) {
            $exampleText = Get-Content $examplePath -Raw
            foreach ($contractMarker in @('## Artifact Contract', '- Reads:', '- Writes:', '- Next consumer')) {
                if ($exampleText -notmatch [regex]::Escape($contractMarker)) {
                    $errors.Add("examples/campus-inventory/$exampleFile missing artifact contract marker $contractMarker.")
                }
            }

            $skillName = $expectedSkillNames[$step - 1]
            foreach ($artifactSnippet in $expectedArtifactSnippets[$skillName]) {
                if ($exampleText -notmatch [regex]::Escape($artifactSnippet)) {
                    $errors.Add("examples/campus-inventory/$exampleFile missing canonical write path $artifactSnippet.")
                }
            }
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

    $changeDetailPath = Join-Path $examplesDir 'changes/CR-001.md'
    if (-not (Test-Path $changeDetailPath)) {
        $errors.Add('examples/campus-inventory missing changes/CR-001.md detailed change artifact.')
    }
    else {
        $changeDetail = Get-Content $changeDetailPath -Raw
        foreach ($section in @('## Change ID', '## Baseline Affected', '## Impact Analysis', '## Approved Scope', '## Approval Gate', '## Before', '## After', '## Verification Needed', '## Rollback and Compatibility', '## Routing Decision')) {
            if ($changeDetail -notmatch [regex]::Escape($section)) {
                $errors.Add("examples/campus-inventory/changes/CR-001.md missing $section.")
            }
        }
    }

    $step01 = Join-Path $examplesDir '01-inception.md'
    $step02 = Join-Path $examplesDir '02-elicitation.md'
    $step03 = Join-Path $examplesDir '03-specification.md'
    $step04 = Join-Path $examplesDir '04-prioritization.md'
    $step06 = Join-Path $examplesDir '06-architecture-design.md'
    $step09 = Join-Path $examplesDir '09-issue-planning.md'
    $step12 = Join-Path $examplesDir '12-test-planning.md'
    $step13 = Join-Path $examplesDir '13-automated-testing.md'
    $step14 = Join-Path $examplesDir '14-acceptance-testing.md'
    $step15 = Join-Path $examplesDir '15-deployment.md'
    $step16 = Join-Path $examplesDir '16-change-request.md'

    Add-MissingTraceErrors -SourcePath $step01 -TargetPath $step02 -Prefixes @('Q') -Label 'Step 02 example' -ErrorList $errors
    Add-MissingTraceErrors -SourcePath $step02 -TargetPath $step03 -Prefixes @('NEED') -Label 'Step 03 example' -ErrorList $errors
    Add-MissingTraceErrors -SourcePath $step03 -TargetPath $step04 -Prefixes @('REQ') -Label 'Step 04 example' -ErrorList $errors
    Add-MissingTraceErrors -SourcePath $step03 -TargetPath $step06 -Prefixes @('REQ') -Label 'Step 06 example' -ErrorList $errors
    Add-MissingTraceErrors -SourcePath $step03 -TargetPath $step09 -Prefixes @('REQ','AC') -Label 'Step 09 example' -ErrorList $errors
    Add-MissingTraceErrors -SourcePath $step03 -TargetPath $step12 -Prefixes @('AC') -Label 'Step 12 example' -ErrorList $errors
    Add-MissingTraceErrors -SourcePath $step09 -TargetPath $step15 -Prefixes @('ISSUE') -Label 'Step 15 release example' -ErrorList $errors
    Add-MissingTraceErrors -SourcePath $step12 -TargetPath $step13 -Prefixes @('TEST') -Label 'Step 13 example' -ErrorList $errors
    Add-MissingTraceErrors -SourcePath $step12 -TargetPath $step15 -Prefixes @('TEST') -Label 'Step 15 release example' -ErrorList $errors
    Add-MissingTraceErrors -SourcePath $step14 -TargetPath $step15 -Prefixes @('UAT') -Label 'Step 15 release example' -ErrorList $errors
    Add-MissingTraceErrors -SourcePath $changeDetailPath -TargetPath $step16 -Prefixes @('CR','REL') -Label 'Step 16 change index' -ErrorList $errors

    $step07Text = Get-Content (Join-Path $examplesDir '07-database-api-design.md') -Raw
    foreach ($requiredLifecycleTerm in @('borrowing_records', 'due_at', 'returned_at')) {
        if ($step07Text -notmatch [regex]::Escape($requiredLifecycleTerm)) {
            $errors.Add("Step 07 example must define $requiredLifecycleTerm so the overdue workflow has a persisted source of truth.")
        }
    }

    $step11Text = Get-Content (Join-Path $examplesDir '11-code-review.md') -Raw
    if ($step11Text -notmatch '(?i)Status:\s*Approved') {
        $errors.Add('Step 11 example must pass its review gate before the workflow advances to step 12.')
    }

    if (Test-Path $changeDetailPath) {
        foreach ($routedSkill in @('03-se-specification','06-se-architecture-design','07-se-database-api-design','08-se-ui-design','09-se-issue-planning','10-se-implementation','11-se-code-review','12-se-test-planning','13-se-automated-testing','14-se-acceptance-testing','15-se-deployment')) {
            if ($changeDetail -notmatch [regex]::Escape($routedSkill)) {
                $errors.Add("Feature CR-001 example bypasses required routed skill $routedSkill.")
            }
        }
    }
}

$testPromptsPath = Join-Path $Root 'examples/test-prompts.md'
if (-not (Test-Path $testPromptsPath)) {
    $errors.Add('Missing examples/test-prompts.md.')
}
else {
    $testPrompts = Get-Content $testPromptsPath -Raw
    foreach ($skillName in $expectedSkillNames) {
        if ($testPrompts -notmatch [regex]::Escape($skillName)) {
            $errors.Add("examples/test-prompts.md does not exercise $skillName.")
        }
    }
}

Get-ChildItem $Root -Recurse -Filter *.md | ForEach-Object {
    $relativePath = $_.FullName.Substring($Root.Length).TrimStart('\','/')
    $markdownDirectory = $_.DirectoryName
    $content = Get-Content $_.FullName -Raw
    $fenceCount = ([regex]::Matches($content, '(?m)^\s*```')).Count
    if (($fenceCount % 2) -ne 0) {
        $errors.Add("$relativePath has an unclosed Markdown code fence.")
    }

    [regex]::Matches($content, '\[[^\]]+\]\(([^)]+)\)') | ForEach-Object {
        $target = $_.Groups[1].Value.Trim().Trim('<','>')
        if ($target -notmatch '^(?i:https?://|mailto:|#)' -and $target -notmatch '^/') {
            $targetWithoutAnchor = $target.Split('#')[0]
            if ($targetWithoutAnchor) {
                $resolvedTarget = Join-Path $markdownDirectory $targetWithoutAnchor
                if (-not (Test-Path $resolvedTarget)) {
                    $errors.Add("$relativePath contains a broken local link: $target.")
                }
            }
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
