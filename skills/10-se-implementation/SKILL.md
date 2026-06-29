---
name: 10-se-implementation
description: Mengerjakan satu issue menjadi code. Use when implementing a selected issue, modifying application code, adding features, fixing bugs, applying migrations, wiring UI/API behavior, or making scoped code changes from an approved task.
---

# Implementation

## Purpose

Use this skill to mengerjakan satu issue menjadi perubahan code yang terkontrol.


## Skill Docs

Before producing this skill's artifact, read `references/skill-docs.md` and apply its procedure, output template, traceability IDs, quality checklist, and handoff guidance.

## Inputs

Selected issue, acceptance criteria, repo context, architecture/design/API/UI specs.

## Required Upstream Artifacts

- Before editing code, open and read `docs/software-engineering/09-issue-planning.md` plus the design artifacts referenced by the selected issue: `docs/software-engineering/06-architecture-design.md`, `docs/software-engineering/07-database-api-design.md`, and/or `docs/software-engineering/08-ui-design.md`.
- Treat the selected `ISSUE` scope and its linked IDs as the implementation boundary. Preserve traceability to `REQ`, `AC`, `API`, and `UI` items in the implementation record.
- If the issue or a referenced design artifact is missing or ambiguous, do not expand scope silently; return to `09-se-issue-planning` or the affected design skill.
- Worked example chain: steps 06-09 in `examples/campus-inventory/` -> `examples/campus-inventory/10-implementation.md`.

## Workflow

- Baca repo dan pattern lokal sebelum mengubah code.
- Batasi perubahan pada scope issue atau approved change scope.
- Implementasikan behavior paling kecil yang memenuhi acceptance criteria.
- Jaga compatibility dengan baseline kecuali issue menyatakan breaking change.
- Catat file yang diubah dan alasan teknis singkat.

## Output

Scoped code changes, migration if needed, implementation notes, manual verification notes.

## Artifact Persistence

- When executing this workflow, save the companion implementation record to `docs/software-engineering/10-implementation.md` in the user's project.
- Create `docs/software-engineering/` when it does not exist. Do not treat a chat response as the final artifact.
- Reopen the saved file to verify it exists and contains the completed output, then report its exact path to the user.
- Preserve an approved baseline unless a change is authorized and recorded through `16-se-change-log-engineering-loop`.
- Use the saved file as the source of truth for the handoff. If the user requests explanation or review only, do not create or modify the artifact.

## Handoff

Kirim diff dan verification notes ke 11-se-code-review.

## Quality Rules

- Keep the work scoped to this skill's single responsibility.
- Preserve traceability to stakeholder goals, requirements, issues, tests, or change requests.
- For enterprise-scale work, call out risk, ownership, dependency, compliance, security, and rollback concerns when relevant.
- Do not overwrite existing baseline artifacts unless the user explicitly asks for replacement and the change is logged.
