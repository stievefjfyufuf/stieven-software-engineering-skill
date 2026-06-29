# 13 Automated Testing

## Artifact Contract

- Reads: `docs/software-engineering/10-implementation.md`, `docs/software-engineering/12-test-planning.md`, and the actual implementation/test framework.
- Writes: test-code changes plus `docs/software-engineering/13-automated-testing.md`.
- Next consumers: steps 14 and 15 use its real command results as a release gate.

## Automated Coverage

| Test ID | Test File | Result | Notes |
|---|---|---|---|
| TEST-001 | `tests/admin-overdue.test.ts` | Pass | Covers overdue filtering. |
| TEST-002 | `tests/admin-overdue-auth.test.ts` | Pass | Covers student and anonymous denial. |
| TEST-003 | `tests/request-submission.test.ts` | Pass | Covers valid request submission. |
| TEST-004 | `tests/approval-flow.test.ts` | Pass | Covers approval decision. |
| TEST-005 | `tests/borrowing-lifecycle.test.ts` | Pass | Covers issue, due date, and return transitions. |
| TEST-006 | `tests/audit-events.test.ts` | Pass | Covers audit events for all mutating workflow actions. |
| TEST-007 | `tests/admin-overdue-boundary.test.ts` | Pass | Covers equality and just-past-due boundary behavior. |

## Verification Evidence

Relevant test suite passes locally with seeded role and equipment fixtures.

## Handoff

Send automated test evidence to `14-se-acceptance-testing`.
