# 16 Change Request

## Change ID

CR-001

## Request

Add email reminders for overdue borrowed equipment after REL-001.

## Reason

UAT feedback showed lab admins want proactive reminders instead of manually checking the overdue dashboard every day.

## Type

Feature addition

## Urgency

Normal

## Baseline Affected

REL-001

## Impact Analysis

| Artifact | Affected? | Before | After | Change Needed | Risk |
|---|---|---|---|---|---|
| Requirements | Yes | No reminder requirement | New reminder requirement | Add REQ/AC | Medium |
| API | Maybe | No notification endpoint | Scheduled reminders may need settings | Analyze | Medium |
| UI | Maybe | No reminder settings | Admin may need opt-in settings | Analyze | Low |
| Tests | Yes | No reminder tests | Reminder schedule and permission tests | Add tests | Medium |
| Deployment | Yes | No email config | SMTP/provider config required | Add env readiness | Medium |

## Approved Scope

- Add requirement and acceptance criteria for overdue email reminders.
- Analyze notification configuration and deployment secrets.
- Add tests for reminder eligibility and role-safe content.

## Not In Scope

- SMS reminders.
- Fine calculation.
- Student self-service reminder settings.

## Approval Gate

| Owner | Required Evidence | Decision | Notes |
|---|---|---|---|
| STK-001 Lab Admin | Updated REQ/AC and UAT scenario | Pending | Must approve reminder timing. |
| STK-004 IT Support | Email provider and secret handling plan | Pending | Must approve deployment readiness. |

## Verification Needed

- Unit tests for reminder eligibility.
- Integration test for scheduled reminder generation.
- UAT scenario for lab admin reminder timing.
- Deployment smoke test for email provider configuration.

## Rollback and Compatibility

Disable scheduled reminder job and keep REL-001 overdue dashboard behavior unchanged.

## Routing Decision

Send to skill(s): 03-se-specification, 07-se-database-api-design, 08-se-ui-design, 09-se-issue-planning, 12-se-test-planning, 15-se-deployment.
