# 08 UI Design

## Screen List

| ID | Screen | User Goal | Data/API | Traceability |
|---|---|---|---|---|
| UI-001 | Admin overdue dashboard | Find overdue equipment | API-001 | REQ-001, AC-001 |
| UI-002 | Student request form | Submit borrowing request | API-002 | REQ-002, AC-002 |
| UI-003 | Lecturer approval queue | Approve or reject requests | API-003, API-004 | REQ-003, AC-003 |

## UI States

- Loading: show skeleton rows for dashboard and queue.
- Empty: show a concise empty state with no action required.
- Error: show retry action and preserve current filters.
- Permission denied: explain that the current role cannot access the page.

## Navigation

Student: catalog -> request form -> request status.

Lecturer: approval queue -> request detail -> decision confirmation.

Lab admin: dashboard -> equipment detail -> borrow record.
