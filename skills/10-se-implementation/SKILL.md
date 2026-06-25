---
name: 10-se-implementation
description: Mengerjakan satu issue menjadi code. Use when implementing a selected issue, modifying application code, adding features, fixing bugs, applying migrations, wiring UI/API behavior, or making scoped code changes from an approved task.
---

# Implementation

## Purpose

Use this skill to mengerjakan satu issue menjadi perubahan code yang terkontrol.

## Inputs

Selected issue, acceptance criteria, repo context, architecture/design/API/UI specs.

## Workflow

- Baca repo dan pattern lokal sebelum mengubah code.
- Batasi perubahan pada scope issue atau approved change scope.
- Implementasikan behavior paling kecil yang memenuhi acceptance criteria.
- Jaga compatibility dengan baseline kecuali issue menyatakan breaking change.
- Catat file yang diubah dan alasan teknis singkat.

## Output

Scoped code changes, migration if needed, implementation notes, manual verification notes.

## Handoff

Kirim diff dan verification notes ke se-code-review.

## Quality Rules

- Keep the work scoped to this skill's single responsibility.
- Preserve traceability to stakeholder goals, requirements, issues, tests, or change requests.
- For enterprise-scale work, call out risk, ownership, dependency, compliance, security, and rollback concerns when relevant.
- Do not overwrite existing baseline artifacts unless the user explicitly asks for replacement and the change is logged.
