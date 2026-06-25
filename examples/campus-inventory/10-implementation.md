# 10 Implementation

## Selected Issue

ISSUE-003 linked to REQ-001, AC-001, API-001, UI-001.

## Scoped Changes

| File Area | Reason |
|---|---|
| API admin overdue route | Add overdue query with role check. |
| Dashboard UI | Render overdue rows and empty/error states. |
| Tests | Cover role denial and overdue filtering. |

## Implementation Notes

- Follow existing auth middleware.
- Reuse request status constants.
- Do not add notification behavior because DEC-001 deferred it.

## Manual Verification

- Admin can load overdue dashboard.
- Student cannot access overdue API.
- Empty overdue list displays correctly.
