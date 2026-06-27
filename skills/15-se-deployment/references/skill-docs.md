# 15 Deployment Skill Docs

## When To Use

Gunakan saat release, deployment checklist, migration rollout, smoke test, rollback, dan post-deploy verification perlu dilakukan.

## Required Inputs

- Accepted build or release candidate.
- Test results, acceptance decision, release scope, migration plan, and environment config.
- Rollback constraints, monitoring expectations, and owner/on-call information when relevant.

## Step Procedure

1. Confirm release scope, version/build ID, environment, secrets/config readiness, and migration readiness.
2. Verify tests and acceptance evidence are current.
3. Write deployment steps, including prechecks, backup/migration steps, feature flags, and post-deploy checks.
4. Define rollback plan with trigger conditions and owner.
5. Run or describe smoke tests for the most important user journeys and health checks.
6. Record deployment result, incidents, follow-up items, and monitoring signals.
7. Mark the new baseline with `REL-###`; send production feedback or failures to `16-se-change-log-engineering-loop`.

## Output Template

```markdown
# Deployment Plan

## Release Scope

## Pre-Deployment Checklist

- [ ] Build ready
- [ ] Tests passed
- [ ] Environment configured
- [ ] Migration reviewed

## Deployment Steps

## Smoke Tests

## Rollback Plan

## Release Notes

## Post-Deployment Result

## New Baseline
```

## Traceability IDs

- Use `REL-###` for release/deployment markers.
- Link release scope to `ISSUE`, `REQ`, `TEST`, `UAT`, and `CR` IDs.

## Mini Example

```markdown
## Release Scope
REL-001 includes ISSUE-001, REQ-001, AC-001, TEST-001, and UAT-001.

## Rollback Plan
Revert release tag v1.0.1 and restore pre-migration backup if smoke test S-001 fails.
```

## Quality Checklist

- Planning versus execution is explicit; no live/shared deployment occurs without user authorization and a named target environment.
- Build, tests, env, secret, dan migration readiness jelas.
- Rollback plan tersedia.
- Smoke test dilakukan.
- Baseline baru ditandai setelah deployment berhasil.

## Handoff

Jika ada incident atau feedback produksi, kirim ke 16-se-change-log-engineering-loop.

## Common Mistakes To Avoid

- Do not skip traceability.
- Do not rewrite a baseline artifact outside the approved scope.
- Do not mix this step with unrelated downstream implementation work.
- Do not hide conflicts, assumptions, or unresolved questions.
