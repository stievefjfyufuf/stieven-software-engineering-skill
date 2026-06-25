---
name: 07-se-database-api-design
description: Membuat tabel database, relasi, dan endpoint API. Use when designing ERD, database tables, fields, relationships, constraints, migrations, REST or RPC endpoints, API contracts, request/response schemas, and integration boundaries.
---

# Database dan API Design

## Purpose

Use this skill to membuat database dan api contract yang traceable.

## Inputs

Architecture component map, data flow, requirements, user stories, NFRs.

## Workflow

- Identifikasi entities dari requirement, user story, dan domain noun.
- Buat tabel dengan primary key, foreign key, required fields, status fields, timestamps, and audit needs.
- Tentukan relasi, cardinality, constraints, indexes, and data retention/security notes.
- Rancang endpoint API berdasarkan use case, bukan hanya tabel.
- Tulis request, response, validation rule, auth rule, error response, and idempotency concern jika relevan.

## Output

ERD, table list, fields, relationships, indexes, API endpoints, request/response contracts, migration notes.

## Handoff

Kirim ERD/API contract ke se-ui-design dan se-issue-planning.

## Quality Rules

- Keep the work scoped to this skill's single responsibility.
- Preserve traceability to stakeholder goals, requirements, issues, tests, or change requests.
- For enterprise-scale work, call out risk, ownership, dependency, compliance, security, and rollback concerns when relevant.
- Do not overwrite existing baseline artifacts unless the user explicitly asks for replacement and the change is logged.
