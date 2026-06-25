# 15 Deployment

## Release Scope

REL-001 includes ISSUE-001, ISSUE-002, ISSUE-003, REQ-001, REQ-002, REQ-003, AC-001, AC-002, AC-003, TEST-001 to TEST-004, and UAT-001 to UAT-003.

## Pre-Deployment Checks

- Build passes.
- Database migrations tested in staging.
- Role-based smoke tests pass.
- Rollback backup confirmed.

## Deployment Plan

1. Deploy database migration.
2. Deploy application.
3. Run smoke tests for student request, lecturer approval, and admin overdue dashboard.
4. Mark REL-001 as baseline if smoke tests pass.

## Rollback Plan

Revert application release and restore pre-migration backup if migration or smoke tests fail.

## Baseline

REL-001 becomes the current baseline after deployment verification passes.
