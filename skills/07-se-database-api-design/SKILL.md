---
name: 07-se-database-api-design
description: Membuat tabel database, relasi, dan endpoint API. Use when designing ERD, database tables, fields, relationships, constraints, migrations, REST or RPC endpoints, API contracts, request/response schemas, and integration boundaries.
---

# Database dan API Design

## Purpose

Use this skill to membuat database dan api contract yang traceable.


## Skill Docs

Before producing this skill's artifact, read `references/skill-docs.md` and apply its procedure, output template, traceability IDs, quality checklist, and handoff guidance.

## Inputs

Architecture component map, data flow, requirements, user stories, NFRs.

## Required Upstream Artifacts

- Before starting, open and read `docs/software-engineering/03-specification.md`, `docs/software-engineering/05-validation-change.md`, and `docs/software-engineering/06-architecture-design.md`.
- Treat the validated requirements and approved architecture as the source of truth. Preserve `REQ`, `NFR`, `AC`, `COMP`, and `ADR` IDs in data and API decisions.
- If a required artifact is missing or contradictory, do not invent a contract. Route the conflict to the relevant upstream skill.
- Worked example chain: steps 03, 05, and 06 in `examples/campus-inventory/` -> `examples/campus-inventory/07-database-api-design.md`.

## Workflow

- Identifikasi entities dari requirement, user story, dan domain noun.
- Buat tabel dengan primary key, foreign key, required fields, status fields, timestamps, and audit needs.
- Tentukan relasi, cardinality, constraints, indexes, and data retention/security notes.
- Rancang endpoint API berdasarkan use case, bukan hanya tabel.
- Tulis request, response, validation rule, auth rule, error response, and idempotency concern jika relevan.

## Output

ERD, table list, fields, relationships, indexes, API endpoints, request/response contracts, migration notes.

## Artifact Persistence

- When executing this workflow, save the completed Markdown artifact to `docs/software-engineering/07-database-api-design.md` in the user's project.
- Create `docs/software-engineering/` when it does not exist. Do not treat a chat response as the final artifact.
- Reopen the saved file to verify it exists and contains the completed output, then report its exact path to the user.
- Preserve an approved baseline unless a change is authorized and recorded through `16-se-change-log-engineering-loop`.
- Use the saved file as the source of truth for the handoff. If the user requests explanation or review only, do not create or modify the artifact.

## Handoff

Kirim ERD/API contract ke 08-se-ui-design dan 09-se-issue-planning.

## Quality Rules

- Keep the work scoped to this skill's single responsibility.
- Preserve traceability to stakeholder goals, requirements, issues, tests, or change requests.
- For enterprise-scale work, call out risk, ownership, dependency, compliance, security, and rollback concerns when relevant.
- Do not overwrite existing baseline artifacts unless the user explicitly asks for replacement and the change is logged.
