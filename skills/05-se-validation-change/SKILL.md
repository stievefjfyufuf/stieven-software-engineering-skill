---
name: 05-se-validation-change
description: Memeriksa requirement dan menganalisis perubahan awal. Use when validating requirements with stakeholders, checking completeness and consistency, reviewing acceptance criteria, handling early requirement changes, or deciding whether a requirement is ready for design.
---

# Validation dan Change

## Purpose

Use this skill to memeriksa requirement dan menganalisis perubahan awal.


## Skill Docs

Before producing this skill's artifact, read `references/skill-docs.md` and apply its procedure, output template, traceability IDs, quality checklist, and handoff guidance.

## Inputs

Prioritized requirements, acceptance criteria, conflict log, stakeholder feedback.

## Workflow

- Periksa requirement: clear, complete, consistent, feasible, testable, and traceable.
- Bandingkan acceptance criteria dengan kebutuhan stakeholder.
- Tandai requirement yang duplicate, conflicting, vague, atau terlalu besar.
- Untuk perubahan awal, catat reason, impact, dan decision.
- Nyatakan apakah requirement siap masuk design atau harus kembali ke elicitation/specification.

## Output

Validated requirement set, rejected/changed items, issue list, readiness decision.

## Handoff

Jika valid, kirim ke 06-se-architecture-design. Jika belum, kembali ke 02-se-elicitation atau 03-se-specification.

## Quality Rules

- Keep the work scoped to this skill's single responsibility.
- Preserve traceability to stakeholder goals, requirements, issues, tests, or change requests.
- For enterprise-scale work, call out risk, ownership, dependency, compliance, security, and rollback concerns when relevant.
- Do not overwrite existing baseline artifacts unless the user explicitly asks for replacement and the change is logged.
