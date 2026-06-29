---
name: 12-se-test-planning
description: Membuat rencana pengujian. Use when designing test strategy, test scenarios, coverage matrix, test data, risk-based testing, unit/integration/e2e scope, regression checks, and validation plan before writing automated tests.
---

# Test Planning

## Purpose

Use this skill to membuat rencana pengujian yang traceable.


## Skill Docs

Before producing this skill's artifact, read `references/skill-docs.md` and apply its procedure, output template, traceability IDs, quality checklist, and handoff guidance.

## Inputs

Requirements, acceptance criteria, issue, architecture, implementation notes, risks.

## Required Upstream Artifacts

- Before starting, open and read `docs/software-engineering/03-specification.md`, `docs/software-engineering/09-issue-planning.md`, `docs/software-engineering/10-implementation.md`, and `docs/software-engineering/11-code-review.md`.
- Treat acceptance criteria, implemented behavior, risks, and accepted review findings as the source of truth. Map every `TEST` to the relevant `REQ`, `AC`, and `ISSUE` IDs.
- If review status is not approved or required evidence is missing, do not mark the test plan ready; route the work to step 10 or 11.
- Worked example chain: steps 03 and 09-11 in `examples/campus-inventory/` -> `examples/campus-inventory/12-test-planning.md`.

## Workflow

- Map acceptance criteria ke test scenarios.
- Pisahkan unit, integration, e2e, manual, performance, security, and regression tests sesuai risiko.
- Tentukan test data dan boundary cases.
- Prioritaskan test untuk behavior berisiko tinggi dan critical flow.
- Tandai bagian yang tidak bisa diotomasi dan perlu manual verification.

## Output

Test strategy, scenario list, coverage matrix, test data, regression checklist.

## Artifact Persistence

- When executing this workflow, save the completed Markdown artifact to `docs/software-engineering/12-test-planning.md` in the user's project.
- Create `docs/software-engineering/` when it does not exist. Do not treat a chat response as the final artifact.
- Reopen the saved file to verify it exists and contains the completed output, then report its exact path to the user.
- Preserve an approved baseline unless a change is authorized and recorded through `16-se-change-log-engineering-loop`.
- Use the saved file as the source of truth for the handoff. If the user requests explanation or review only, do not create or modify the artifact.

## Handoff

Kirim test plan ke 13-se-automated-testing.

## Quality Rules

- Keep the work scoped to this skill's single responsibility.
- Preserve traceability to stakeholder goals, requirements, issues, tests, or change requests.
- For enterprise-scale work, call out risk, ownership, dependency, compliance, security, and rollback concerns when relevant.
- Do not overwrite existing baseline artifacts unless the user explicitly asks for replacement and the change is logged.
