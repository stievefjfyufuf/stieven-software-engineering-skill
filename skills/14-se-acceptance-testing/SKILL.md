---
name: 14-se-acceptance-testing
description: Menguji alur lengkap pengguna. Use when validating completed work against acceptance criteria, user journeys, UAT checklists, manual verification flows, release readiness, and stakeholder acceptance before deployment.
---

# Acceptance Testing

## Purpose

Use this skill to menguji apakah user flow lengkap diterima.


## Skill Docs

Before producing this skill's artifact, read `references/skill-docs.md` and apply its procedure, output template, traceability IDs, quality checklist, and handoff guidance.

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

## Artifact Persistence

- When executing this workflow, save the completed Markdown artifact to `docs/software-engineering/14-acceptance-testing.md` in the user's project.
- Create `docs/software-engineering/` when it does not exist. Do not treat a chat response as the final artifact.
- Reopen the saved file to verify it exists and contains the completed output, then report its exact path to the user.
- Preserve an approved baseline unless a change is authorized and recorded through `16-se-change-log-engineering-loop`.
- Use the saved file as the source of truth for the handoff. If the user requests explanation or review only, do not create or modify the artifact.

## Handoff

Jika diterima, lanjut ke 15-se-deployment. Jika ditolak sebelum baseline pertama dibuat, kirim defect ke 10-se-implementation atau skill upstream yang terdampak lalu ulangi review dan testing. Gunakan 16-se-change-log-engineering-loop hanya untuk feedback yang mengubah baseline yang sudah disetujui atau untuk scope baru yang sengaja ditunda.

## Quality Rules

- Keep the work scoped to this skill's single responsibility.
- Preserve traceability to stakeholder goals, requirements, issues, tests, or change requests.
- For enterprise-scale work, call out risk, ownership, dependency, compliance, security, and rollback concerns when relevant.
- Do not overwrite existing baseline artifacts unless the user explicitly asks for replacement and the change is logged.
