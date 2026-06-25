---
name: 13-se-automated-testing
description: Membuat unit test dan integration test. Use when adding or updating automated tests, verifying features or bug fixes, covering API/database/UI logic, improving regression coverage, or running test suites after implementation.
---

# Automated Testing

## Purpose

Use this skill to membuat dan menjalankan automated tests yang relevan.


## Skill Docs

Before producing this skill's artifact, read `references/skill-docs.md` and apply its procedure, output template, traceability IDs, quality checklist, and handoff guidance.

## Inputs

Test plan, implementation diff, repo test framework, acceptance criteria.

## Workflow

- Ikuti test framework dan pattern yang sudah ada di repo.
- Tambahkan tests yang langsung menutup acceptance criteria dan risiko utama.
- Gunakan fixtures/test data yang stabil dan tidak bergantung layanan eksternal jika tidak perlu.
- Jalankan test relevan terlebih dahulu, lalu broader suite jika feasible.
- Jika test gagal, bedakan bug implementation, test bug, atau flaky/environment issue.

## Output

Unit tests, integration tests, test run results, coverage notes, failures and fixes.

## Handoff

Jika tests lolos, lanjut ke 14-se-acceptance-testing. Jika gagal karena bug, kembali ke 10-se-implementation.

## Quality Rules

- Keep the work scoped to this skill's single responsibility.
- Preserve traceability to stakeholder goals, requirements, issues, tests, or change requests.
- For enterprise-scale work, call out risk, ownership, dependency, compliance, security, and rollback concerns when relevant.
- Do not overwrite existing baseline artifacts unless the user explicitly asks for replacement and the change is logged.
