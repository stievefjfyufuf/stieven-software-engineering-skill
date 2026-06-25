# 13 Automated Testing

## Automated Coverage

| Test ID | Test File | Result | Notes |
|---|---|---|---|
| TEST-001 | `tests/admin-overdue.test.ts` | Pass | Covers overdue filtering. |
| TEST-002 | `tests/admin-overdue-auth.test.ts` | Pass | Covers student and anonymous denial. |
| TEST-003 | `tests/request-submission.test.ts` | Pass | Covers valid request submission. |
| TEST-004 | `tests/approval-flow.test.ts` | Pass | Covers approval decision. |

## Verification Evidence

Relevant test suite passes locally with seeded role and equipment fixtures.

## Handoff

Send automated test evidence to `14-se-acceptance-testing`.
