---
name: 16-se-change-log-engineering-loop
description: Mencatat perubahan, impact analysis, approved scope, dan menjaga baseline. Use when a PRD, design, codebase, test suite, or deployed app already exists and the user requests a change, bug fix, addition, removal, refactor, scope adjustment, or release correction that must preserve existing baseline artifacts.
---

# Change Log dan Engineering Loop

## Purpose

Use this skill to mengatur perubahan tanpa merusak baseline PRD, design, code, test, atau app yang sudah stabil.


## Skill Docs

For detailed step documentation, templates, checklist, and handoff guidance, read references/skill-docs.md after this file when the user asks for full docs or when the step output needs more structure.

## Inputs

User change request, current baseline, PRD/design/code/test/deployment artifacts, stakeholder feedback.

## Workflow

- Catat permintaan sebagai Change Request dengan id, request, reason, type, urgency, and requester if known.
- Bandingkan request dengan baseline: PRD, requirement, architecture, database, API, UI, code, tests, and deployment.
- Buat impact analysis: affected artifacts, unaffected artifacts, risk, dependency, and possible conflicts.
- Klasifikasikan perubahan: bug fix, feature addition, behavior change, removal, refactor, hotfix, rollback, atau breaking change.
- Tentukan approved scope: bagian yang boleh diubah dan bagian yang tidak boleh disentuh.
- Tetapkan approval gate: siapa yang harus menyetujui dan evidence apa yang wajib ada sebelum baseline berubah.
- Tulis change log dengan Before, After, Reason, Impact, Risk, Verification Needed.
- Route pekerjaan hanya ke skill yang terdampak; jangan rewrite PRD/app penuh untuk perubahan kecil.

## Output

Change request, impact analysis, approval gate, change log, approved scope, affected artifacts, verification plan, rollback/compatibility notes, routing decision.

## Handoff

Kirim approved scope ke skill terdampak: specification, design, issue planning, implementation, testing, atau deployment.

## Quality Rules

- Keep the work scoped to this skill's single responsibility.
- Preserve traceability to stakeholder goals, requirements, issues, tests, or change requests.
- For enterprise-scale work, call out risk, ownership, dependency, compliance, security, and rollback concerns when relevant.
- Update the baseline only after the routed work has passed review, testing, acceptance, and deployment checks that apply to the change.
- Do not overwrite existing baseline artifacts unless the user explicitly asks for replacement and the change is logged.
