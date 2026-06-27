---
name: 15-se-deployment
description: Mempublikasikan aplikasi dan memeriksa hasilnya. Use when preparing release, deployment checklist, environment configuration, CI/CD verification, database migration rollout, smoke tests, rollback plan, release notes, and post-deploy validation.
---

# Deployment

## Purpose

Use this skill to mempublikasikan aplikasi dan memeriksa hasilnya.


## Skill Docs

Before producing this skill's artifact, read `references/skill-docs.md` and apply its procedure, output template, traceability IDs, quality checklist, and handoff guidance.

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

## Artifact Persistence

- When executing this workflow, save the completed deployment record to `docs/software-engineering/15-deployment.md` in the user's project.
- Create `docs/software-engineering/` when it does not exist. Do not treat a chat response as the final artifact.
- Reopen the saved file to verify it exists and contains the completed output, then report its exact path to the user.
- Preserve an approved baseline unless a change is authorized and recorded through `16-se-change-log-engineering-loop`.
- Use the saved file as the source of truth for the handoff. If the user requests explanation or review only, do not create or modify the artifact.

## Handoff

Jika ada masalah deployment atau feedback produksi, kirim ke 16-se-change-log-engineering-loop.

## Quality Rules

- Keep the work scoped to this skill's single responsibility.
- Distinguish deployment planning from execution. Do not change a live or shared environment without explicit user authorization, a named target environment, and confirmed rollback readiness.
- Preserve traceability to stakeholder goals, requirements, issues, tests, or change requests.
- For enterprise-scale work, call out risk, ownership, dependency, compliance, security, and rollback concerns when relevant.
- Do not overwrite existing baseline artifacts unless the user explicitly asks for replacement and the change is logged.
