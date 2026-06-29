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

## Required Upstream Artifacts

- Before changing tests, open and read `docs/software-engineering/10-implementation.md` and `docs/software-engineering/12-test-planning.md`, then inspect the actual implementation and existing test framework.
- Treat the mapped `TEST`, `REQ`, `AC`, and `ISSUE` IDs as the required coverage boundary. Record real commands and results; never fabricate execution evidence.
- If the test plan or implementation evidence is missing, request it or return to the appropriate upstream skill before claiming coverage.
- Worked example chain: `examples/campus-inventory/10-implementation.md` + `examples/campus-inventory/12-test-planning.md` -> `examples/campus-inventory/13-automated-testing.md`.

## Workflow

- Ikuti test framework dan pattern yang sudah ada di repo.
- Tambahkan tests yang langsung menutup acceptance criteria dan risiko utama.
- Gunakan fixtures/test data yang stabil dan tidak bergantung layanan eksternal jika tidak perlu.
- Jalankan test relevan terlebih dahulu, lalu broader suite jika feasible.
- Jika test gagal, bedakan bug implementation, test bug, atau flaky/environment issue.

## Output

Unit tests, integration tests, test run results, coverage notes, failures and fixes.

## Artifact Persistence

- When executing this workflow, save the companion automated-testing record to `docs/software-engineering/13-automated-testing.md` in the user's project.
- Create `docs/software-engineering/` when it does not exist. Do not treat a chat response as the final artifact.
- Reopen the saved file to verify it exists and contains the completed output, then report its exact path to the user.
- Preserve an approved baseline unless a change is authorized and recorded through `16-se-change-log-engineering-loop`.
- Use the saved file as the source of truth for the handoff. If the user requests explanation or review only, do not create or modify the artifact.

## Handoff

Jika tests lolos, lanjut ke 14-se-acceptance-testing. Jika gagal karena bug, kembali ke 10-se-implementation.

## Quality Rules

- Keep the work scoped to this skill's single responsibility.
- Preserve traceability to stakeholder goals, requirements, issues, tests, or change requests.
- For enterprise-scale work, call out risk, ownership, dependency, compliance, security, and rollback concerns when relevant.
- Do not overwrite existing baseline artifacts unless the user explicitly asks for replacement and the change is logged.
