---
name: 11-se-code-review
description: Memeriksa code, test, risiko, dan regresi. Use when reviewing diffs, pull requests, implementation changes, tests, migrations, security risks, performance issues, maintainability concerns, regressions, and missing coverage.
---

# Code Review

## Purpose

Use this skill to memeriksa code dan test sebelum masuk testing lebih luas.

## Inputs

Code diff, issue, acceptance criteria, tests, architecture/design constraints.

## Workflow

- Prioritaskan bugs, behavioral regressions, security risk, data loss risk, and missing tests.
- Rujuk file/line ketika memberi temuan.
- Cek apakah perubahan keluar dari scope issue.
- Pastikan acceptance criteria punya coverage atau manual verification.
- Berikan decision: approve, request changes, or block.

## Output

Review findings ordered by severity, missing tests, regression risks, approval/block decision.

## Handoff

Jika lolos, lanjut ke se-test-planning. Jika gagal, kembali ke se-implementation.

## Quality Rules

- Keep the work scoped to this skill's single responsibility.
- Preserve traceability to stakeholder goals, requirements, issues, tests, or change requests.
- For enterprise-scale work, call out risk, ownership, dependency, compliance, security, and rollback concerns when relevant.
- Do not overwrite existing baseline artifacts unless the user explicitly asks for replacement and the change is logged.
