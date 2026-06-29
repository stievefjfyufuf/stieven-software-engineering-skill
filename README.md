# Stieven Software Engineering Skill

This repository contains 16 Codex skills for an end-to-end software engineering workflow, from inception to deployment, with an engineering loop for controlled changes.

Use these skills when you want Codex to work like a disciplined software engineering partner: clarify the problem first, keep requirements traceable, design before coding, implement in small scoped changes, verify behavior, deploy with rollback awareness, and route future changes through a controlled baseline loop.

## Skills

01. 01-se-inception-stakeholder
02. 02-se-elicitation
03. 03-se-specification
04. 04-se-prioritization
05. 05-se-validation-change
06. 06-se-architecture-design
07. 07-se-database-api-design
08. 08-se-ui-design
09. 09-se-issue-planning
10. 10-se-implementation
11. 11-se-code-review
12. 12-se-test-planning
13. 13-se-automated-testing
14. 14-se-acceptance-testing
15. 15-se-deployment
16. 16-se-change-log-engineering-loop

## Workflow

Requirement discovery -> specification -> prioritization -> validation -> architecture -> database/API -> UI -> issues -> implementation -> review -> testing -> acceptance -> deployment -> baseline -> controlled change loop.

Recommended sequence:

1. Start with `01-se-inception-stakeholder` when the project idea is still rough.
2. Use `02-se-elicitation` and `03-se-specification` to turn stakeholder needs into testable requirements.
3. Use `04-se-prioritization` and `05-se-validation-change` to decide MVP scope and readiness.
4. Use `06-se-architecture-design`, `07-se-database-api-design`, and `08-se-ui-design` before writing implementation issues.
5. Use `09-se-issue-planning` to create developer-ready tasks.
6. Use `10-se-implementation` through `14-se-acceptance-testing` to implement, review, test, and validate.
7. Use `15-se-deployment` to release and mark the new baseline.
8. Use `16-se-change-log-engineering-loop` for every later bug fix, feature addition, refactor, or correction that affects an existing baseline.

You can skip a step only when its artifact already exists and is current. When skipping, note the artifact used as the source of truth.

## Runtime Artifact Persistence

When a skill executes its workflow, it must write the completed artifact into the user's project. A response shown only in chat is not a completed workflow artifact. Explanation-only and review-only requests remain read-only unless the user authorizes artifact creation.

The canonical runtime artifact directory is `docs/software-engineering/`:

| Step | Saved artifact |
|---|---|
| 01 | `01-inception.md` |
| 02 | `02-elicitation.md` |
| 03 | `03-specification.md` |
| 04 | `04-prioritization.md` |
| 05 | `05-validation-change.md` |
| 06 | `06-architecture-design.md` |
| 07 | `07-database-api-design.md` |
| 08 | `08-ui-design.md` |
| 09 | `09-issue-planning.md` |
| 10 | `10-implementation.md` |
| 11 | `11-code-review.md` |
| 12 | `12-test-planning.md` |
| 13 | `13-automated-testing.md` |
| 14 | `14-acceptance-testing.md` |
| 15 | `15-deployment.md` |
| 16 | `16-change-request.md` plus `changes/CR-###.md` |

Each executing skill must create the directory when needed, write its Markdown artifact, reopen it to verify persistence, report the exact path, and use that saved path as the source of truth for handoff. Step 10 also changes source code, step 13 also creates or updates automated tests, and their Markdown files are companion evidence records rather than replacements for code or tests.

Approved baseline artifacts must not be silently overwritten. Route baseline-affecting revisions through step 16, preserve prior change history, and store detailed change requests under `docs/software-engineering/changes/`.

## Upstream Artifact Read Contracts

Every skill declares `## Required Upstream Artifacts` in its `SKILL.md`. Before producing a downstream artifact, the agent must open the listed files from the user's project, preserve their traceability IDs, and use them as the source of truth. Conceptual input names or chat history do not replace those files.

| Step | Must read before execution |
|---|---|
| 01 | User brief and existing project context; no generated upstream artifact |
| 02 | `01-inception.md` |
| 03 | `01-inception.md`, `02-elicitation.md` |
| 04 | `01-inception.md`, `03-specification.md` |
| 05 | `02-elicitation.md`, `03-specification.md`, `04-prioritization.md` |
| 06 | `03-specification.md`, `05-validation-change.md` |
| 07 | `03-specification.md`, `05-validation-change.md`, `06-architecture-design.md` |
| 08 | `03-specification.md`, `04-prioritization.md`, `07-database-api-design.md` |
| 09 | `03-specification.md` through `08-ui-design.md` |
| 10 | `09-issue-planning.md` plus referenced step 06-08 design artifacts |
| 11 | `09-issue-planning.md`, `10-implementation.md`, actual diff and tests |
| 12 | `03-specification.md`, `09-issue-planning.md`, `10-implementation.md`, `11-code-review.md` |
| 13 | `10-implementation.md`, `12-test-planning.md`, implementation and test framework |
| 14 | `03-specification.md`, `08-ui-design.md`, `12-test-planning.md`, `13-automated-testing.md` |
| 15 | `09-issue-planning.md`, `13-automated-testing.md`, `14-acceptance-testing.md` |
| 16 | `15-deployment.md`, every affected baseline artifact, and existing change records |

When a required artifact is missing, the skill must not silently reconstruct or bypass it. Ask for equivalent approved input or route the workflow to the missing upstream skill. Worked examples under `examples/campus-inventory/` include an `Artifact Contract` section showing what each step reads, writes, and hands off.

## Traceability ID Standard

Use stable IDs across all artifacts so Codex can connect goals, requirements, issues, code, tests, releases, and changes:

| Prefix | Meaning | Example |
|---|---|---|
| `GOAL` | Business, user, or technical goal | `GOAL-001` |
| `STK` | Stakeholder or stakeholder group | `STK-001` |
| `ASSUMP` | Scope or risk-bearing assumption | `ASSUMP-001` |
| `NEED` | Raw elicited need | `NEED-001` |
| `Q` | Follow-up question or blocked decision | `Q-001` |
| `REQ` | Functional requirement | `REQ-001` |
| `NFR` | Non-functional requirement | `NFR-001` |
| `AC` | Acceptance criteria | `AC-001` |
| `DEC` | Prioritization or readiness decision | `DEC-001` |
| `VAL` | Validation finding | `VAL-001` |
| `ADR` | Architecture decision record | `ADR-001` |
| `COMP` | Architecture component | `COMP-001` |
| `DATA` | Data entity, table, or persistence concern | `DATA-001` |
| `API` | API contract item | `API-001` |
| `UI` | Screen, flow, or UI state | `UI-001` |
| `ISSUE` | Implementation issue/task | `ISSUE-001` |
| `DEP` | Cross-issue dependency | `DEP-001` |
| `FINDING` | Actionable code review finding | `FINDING-001` |
| `TEST` | Test scenario or automated test | `TEST-001` |
| `UAT` | Acceptance/UAT checklist item | `UAT-001` |
| `REL` | Release or deployment marker | `REL-001` |
| `S` | Deployment smoke test | `S-001` |
| `CR` | Change request | `CR-001` |

Every downstream artifact should reference the upstream ID that justified it. For example: `ISSUE-004` should link to `REQ-002`, `AC-006`, `API-003`, and any relevant `UI-002`.

## Example Prompts

```text
Use 01-se-inception-stakeholder for this app idea: a campus inventory system for lab equipment.
```

```text
Use 03-se-specification to convert these elicitation notes into requirements, user stories, NFRs, acceptance criteria, and traceability IDs.
```

```text
Use 09-se-issue-planning to break this validated requirement set and UI/API design into GitHub-ready implementation issues.
```

```text
Use 16-se-change-log-engineering-loop. Baseline REL-002 exists, and I want to add role-based approval for equipment requests.
```

## Skill Docs

Each numbered skill includes `references/skill-docs.md` with detailed usage docs, output templates, quality checklist, and handoff guidance for that step. Each `SKILL.md` and agent prompt is expected to require reading those docs before producing the step artifact.

## Validation

Run the local validator before publishing changes:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/validate-skills.ps1
```

The validator checks the exact numbered skill set, canonical artifact paths, required project files and sections, front matter, required docs usage, agent prompt depth, example completeness, balanced Markdown fences, local links, test-prompt coverage, lifecycle data needed by the overdue example, cross-step traceability, the step 16 index/detail pair, placeholder text, and whether used ID prefixes are registered in the README traceability table.

## Examples

See `examples/campus-inventory/` for an end-to-end sample artifact set that walks through all 16 skills using a campus lab inventory system.

See `examples/test-prompts.md` for quick prompts that can be used after installing the skills to verify that each skill is discoverable and behaves as expected.

## Install

For user-wide local use, copy the folders inside `skills/` into `~/.agents/skills`. For repository-scoped use, copy them into `<repo>/.agents/skills`.

After copying, restart Codex or reload skills if your environment requires it. The skill folder name and the `name:` field inside each `SKILL.md` are intentionally the same.

Common install locations:

| Scope | Environment | Skill directory |
|---|---|---|
| User | Windows | `%USERPROFILE%\.agents\skills` |
| User | macOS/Linux | `~/.agents/skills` |
| Repository | All | `<repo>/.agents/skills` |

After install, use one of the example prompts to confirm the skill appears in Codex. If a skill does not appear, confirm the copied folder contains `SKILL.md` at its root and restart Codex.

## Release Checklist

- [ ] Run `scripts/validate-skills.ps1`.
- [ ] Confirm README traceability IDs match all IDs used in skill docs.
- [ ] Review the end-to-end example for stale handoffs.
- [ ] Check each changed skill has a clear output template and handoff.
- [ ] Update changelog or release notes when publishing a new version.
- [ ] Confirm agent prompts remain concise but include quality gates, traceability, risk, verification, and handoff expectations.

## Contributing and License

See `CONTRIBUTING.md` for contribution rules and prompt quality guidance.

This project is licensed under the MIT License. See `LICENSE`.

## Quality Bar

- Keep each step scoped to its responsibility.
- Prefer explicit assumptions over hidden guesses.
- Preserve traceability IDs from step to step.
- Record conflicts, risks, ownership, dependencies, security/compliance concerns, migration impact, rollback needs, and verification evidence when relevant.
- Do not rewrite a baseline artifact outside an approved change request.
