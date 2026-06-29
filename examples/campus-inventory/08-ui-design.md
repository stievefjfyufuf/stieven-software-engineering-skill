# 08 UI Design

## Artifact Contract

- Reads: `docs/software-engineering/03-specification.md`, `docs/software-engineering/04-prioritization.md`, and `docs/software-engineering/07-database-api-design.md`.
- Writes: `docs/software-engineering/08-ui-design.md`.
- Next consumers: steps 09, 10, and 14 preserve its screens, flows, and states.

## Screen List

| ID | Screen | User Goal | Data/API | Traceability |
|---|---|---|---|---|
| UI-001 | Admin overdue dashboard | Find overdue equipment | API-001 | REQ-001, AC-001 |
| UI-002 | Student request form | Submit borrowing request | API-002 | REQ-002, AC-002 |
| UI-003 | Lecturer approval queue | Approve or reject requests | API-003, API-004 | REQ-003, AC-003 |
| UI-004 | Admin issue and return flow | Record due date, issue, and return | API-005, API-006 | REQ-005, AC-005 |

## UI States

- Loading: show skeleton rows for dashboard and queue.
- Empty: show a concise empty state with no action required.
- Error: show retry action and preserve current filters.
- Permission denied: explain that the current role cannot access the page.

## Navigation

Student: catalog -> request form -> request status.

Lecturer: approval queue -> request detail -> decision confirmation.

Lab admin: dashboard -> approved request -> issue form -> active borrowing record -> return confirmation.
