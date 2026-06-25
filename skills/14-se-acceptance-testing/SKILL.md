---
name: 14-se-acceptance-testing
description: Menguji alur lengkap pengguna. Use when validating completed work against acceptance criteria, user journeys, UAT checklists, manual verification flows, release readiness, and stakeholder acceptance before deployment.
---

# Acceptance Testing

## Purpose

Use this skill to menguji apakah user flow lengkap diterima.

## Inputs

Acceptance criteria, user flow, implemented feature, automated test results, deployment candidate.

## Workflow

- Ubah acceptance criteria menjadi checklist pengguna.
- Jalankan happy path, important edge cases, and role/permission cases.
- Pastikan UI/API/database behavior konsisten dari perspektif user.
- Catat evidence, defect, and feedback.
- Berikan decision: accepted, accepted with notes, or rejected.

## Output

UAT checklist, pass/fail result, evidence, accepted/rejected decision, feedback items.

## Handoff

Jika diterima, lanjut ke se-deployment. Jika ditolak, kirim feedback ke se-change-log-engineering-loop.

## Quality Rules

- Keep the work scoped to this skill's single responsibility.
- Preserve traceability to stakeholder goals, requirements, issues, tests, or change requests.
- For enterprise-scale work, call out risk, ownership, dependency, compliance, security, and rollback concerns when relevant.
- Do not overwrite existing baseline artifacts unless the user explicitly asks for replacement and the change is logged.
