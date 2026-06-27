# 14 Acceptance Testing

## UAT Checklist

| ID | Actor | Scenario | Expected Result | Traceability | Status |
|---|---|---|---|---|---|
| UAT-001 | Lab Admin | Open overdue dashboard | Overdue items are visible with borrower and due date. | REQ-001, AC-001, TEST-001 | Pass |
| UAT-002 | Student | Submit borrowing request | Request is created as pending. | REQ-002, AC-002, TEST-003 | Pass |
| UAT-003 | Lecturer | Approve pending request | Request status changes to approved. | REQ-003, AC-003, TEST-004 | Pass |
| UAT-004 | Lab Admin | Issue and return approved equipment | Active borrowing stores its due date and closes on return. | REQ-005, AC-005, TEST-005 | Pass |
| UAT-005 | Lab Admin | Inspect audit history | Request, approval, issue, and return events show actor and timestamp. | REQ-004, AC-004, TEST-006 | Pass |

## Acceptance Decision

Accepted for release REL-001.

## Feedback

Stakeholders request email reminders after MVP. Route as future CR after baseline.
