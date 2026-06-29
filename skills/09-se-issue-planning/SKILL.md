---
name: 09-se-issue-planning
description: Mengubah requirement menjadi GitHub Issues atau task teknis. Use when breaking validated requirements and designs into implementation issues, tasks, subtasks, labels, dependencies, milestones, sprint backlog, or developer-ready work items.
---

# Issue Planning

## Purpose

Use this skill to mengubah requirement dan design menjadi task implementasi.


## Skill Docs

Before producing this skill's artifact, read `references/skill-docs.md` and apply its procedure, output template, traceability IDs, quality checklist, and handoff guidance.

## Inputs

Validated requirements, architecture, ERD, API contract, UI specs, priority order.

## Required Upstream Artifacts

- Before starting, open and read `docs/software-engineering/03-specification.md`, `docs/software-engineering/04-prioritization.md`, `docs/software-engineering/05-validation-change.md`, `docs/software-engineering/06-architecture-design.md`, `docs/software-engineering/07-database-api-design.md`, and `docs/software-engineering/08-ui-design.md`.
- Use only validated, prioritized scope. Preserve the relevant `REQ`, `NFR`, `AC`, `ADR`, `DATA`, `API`, and `UI` IDs in every issue.
- If a required artifact is missing or conflicting, do not create implementation-ready issues for the affected scope; route the gap upstream.
- Worked example chain: steps 03-08 in `examples/campus-inventory/` -> `examples/campus-inventory/09-issue-planning.md`.

## Workflow

- Buat satu issue untuk satu outcome yang dapat direview.
- Tuliskan context, scope, acceptance criteria, technical notes, dependencies, and out-of-scope.
- Pecah issue besar menjadi backend, frontend, database, test, and documentation tasks jika perlu.
- Urutkan issue berdasarkan dependency dan prioritas.
- Pastikan setiap issue traceable ke requirement atau change request.

## Output

Issue list, task breakdown, acceptance checklist per issue, dependency map, milestone/sprint grouping.

## Artifact Persistence

- When executing this workflow, save the completed Markdown artifact to `docs/software-engineering/09-issue-planning.md` in the user's project.
- Create `docs/software-engineering/` when it does not exist. Do not treat a chat response as the final artifact.
- Reopen the saved file to verify it exists and contains the completed output, then report its exact path to the user.
- Preserve an approved baseline unless a change is authorized and recorded through `16-se-change-log-engineering-loop`.
- Use the saved file as the source of truth for the handoff. If the user requests explanation or review only, do not create or modify the artifact.

## Handoff

Kirim satu issue terpilih ke 10-se-implementation.

## Quality Rules

- Keep the work scoped to this skill's single responsibility.
- Preserve traceability to stakeholder goals, requirements, issues, tests, or change requests.
- For enterprise-scale work, call out risk, ownership, dependency, compliance, security, and rollback concerns when relevant.
- Do not overwrite existing baseline artifacts unless the user explicitly asks for replacement and the change is logged.
