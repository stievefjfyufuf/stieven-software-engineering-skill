---
name: 11-se-code-review
description: Memeriksa code, test, risiko, dan regresi. Use when reviewing diffs, pull requests, implementation changes, tests, migrations, security risks, performance issues, maintainability concerns, regressions, and missing coverage.
---

# Code Review

## Purpose

Use this skill to memeriksa code dan test sebelum masuk testing lebih luas.


## Skill Docs

Before producing this skill's artifact, read `references/skill-docs.md` and apply its procedure, output template, traceability IDs, quality checklist, and handoff guidance.

## Inputs

Code diff, issue, acceptance criteria, tests, architecture/design constraints.

## Required Upstream Artifacts

- Before reviewing, open and read `docs/software-engineering/09-issue-planning.md` and `docs/software-engineering/10-implementation.md`, then inspect the actual changed files, diff, and tests.
- Treat the selected `ISSUE`, linked acceptance criteria, and implementation record as the review boundary. Preserve linked IDs in every `FINDING` and decision.
- If the implementation record, diff, or issue evidence is missing, do not approve the review; request the missing evidence or return to step 10.
- Worked example chain: `examples/campus-inventory/09-issue-planning.md` + `examples/campus-inventory/10-implementation.md` -> `examples/campus-inventory/11-code-review.md`.

## Workflow

- Prioritaskan bugs, behavioral regressions, security risk, data loss risk, and missing tests.
- Rujuk file/line ketika memberi temuan.
- Cek apakah perubahan keluar dari scope issue.
- Pastikan acceptance criteria punya coverage atau manual verification.
- Berikan decision: approve, request changes, or block.

## Output

Review findings ordered by severity, missing tests, regression risks, approval/block decision.

## Artifact Persistence

- When executing this workflow, save the completed Markdown artifact to `docs/software-engineering/11-code-review.md` in the user's project.
- Create `docs/software-engineering/` when it does not exist. Do not treat a chat response as the final artifact.
- Reopen the saved file to verify it exists and contains the completed output, then report its exact path to the user.
- Preserve an approved baseline unless a change is authorized and recorded through `16-se-change-log-engineering-loop`.
- Use the saved file as the source of truth for the handoff. If the user requests explanation or review only, do not create or modify the artifact.

## Handoff

Jika lolos, lanjut ke 12-se-test-planning. Jika gagal, kembali ke 10-se-implementation.

## Quality Rules

- Keep the work scoped to this skill's single responsibility.
- Preserve traceability to stakeholder goals, requirements, issues, tests, or change requests.
- For enterprise-scale work, call out risk, ownership, dependency, compliance, security, and rollback concerns when relevant.
- Do not overwrite existing baseline artifacts unless the user explicitly asks for replacement and the change is logged.
