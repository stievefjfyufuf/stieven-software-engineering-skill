# 15 Deployment

## Artifact Contract

- Reads: `docs/software-engineering/09-issue-planning.md`, `docs/software-engineering/13-automated-testing.md`, and `docs/software-engineering/14-acceptance-testing.md`.
- Writes: `docs/software-engineering/15-deployment.md` and establishes the approved `REL` baseline.
- Next consumer: step 16 reads this baseline before analyzing any later change.

## Release Scope

REL-001 includes ISSUE-001, ISSUE-002, ISSUE-003, ISSUE-004; REQ-001, REQ-002, REQ-003, REQ-004, REQ-005; AC-001, AC-002, AC-003, AC-004, AC-005; TEST-001, TEST-002, TEST-003, TEST-004, TEST-005, TEST-006, TEST-007; and UAT-001, UAT-002, UAT-003, UAT-004, UAT-005.

## Pre-Deployment Checks

- Build passes.
- Database migrations tested in staging.
- Role-based smoke tests pass.
- Rollback backup confirmed.

## Deployment Plan

1. Deploy database migration.
2. Deploy application.
3. Run smoke tests for student request, lecturer approval, equipment issue/return, audit history, and admin overdue dashboard.
4. Mark REL-001 as baseline if smoke tests pass.

## Rollback Plan

Revert application release and restore pre-migration backup if migration or smoke tests fail.

## Baseline

REL-001 becomes the current baseline after deployment verification passes.
