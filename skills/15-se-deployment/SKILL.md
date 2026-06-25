---
name: 15-se-deployment
description: Mempublikasikan aplikasi dan memeriksa hasilnya. Use when preparing release, deployment checklist, environment configuration, CI/CD verification, database migration rollout, smoke tests, rollback plan, release notes, and post-deploy validation.
---

# Deployment

## Purpose

Use this skill to mempublikasikan aplikasi dan memeriksa hasilnya.

## Inputs

Accepted build, test results, release scope, environment config, migration plan.

## Workflow

- Pastikan build, tests, env vars, migrations, and secrets readiness sudah jelas.
- Tulis release notes berdasarkan issue/change request.
- Rencanakan deployment order dan rollback.
- Jalankan smoke test setelah deploy.
- Jika berhasil, tandai PRD/design/code/test/deployment sebagai project baseline baru.

## Output

Deployment checklist, release notes, smoke test result, rollback plan, deployment result, new baseline marker.

## Handoff

Jika ada masalah deployment atau feedback produksi, kirim ke se-change-log-engineering-loop.

## Quality Rules

- Keep the work scoped to this skill's single responsibility.
- Preserve traceability to stakeholder goals, requirements, issues, tests, or change requests.
- For enterprise-scale work, call out risk, ownership, dependency, compliance, security, and rollback concerns when relevant.
- Do not overwrite existing baseline artifacts unless the user explicitly asks for replacement and the change is logged.
