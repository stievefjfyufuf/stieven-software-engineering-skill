# 03 Specification

## Functional Requirements

| ID | Requirement | Source | Acceptance Criteria |
|---|---|---|---|
| REQ-001 | The system shall show overdue borrowed equipment to lab admins. | NEED-001, GOAL-001 | AC-001 |
| REQ-002 | The system shall let students submit equipment borrowing requests. | NEED-002, GOAL-002 | AC-002 |
| REQ-003 | The system shall let lecturers approve or reject requests that require academic approval. | NEED-003, GOAL-003 | AC-003 |
| REQ-004 | The system shall record audit events for request, approval, borrow, and return actions. | NEED-004, GOAL-003 | AC-004 |

## Non-Functional Requirements

| ID | Requirement | Evaluation |
|---|---|---|
| NFR-001 | Only authorized roles can access admin and approval functions. | Permission tests cover admin, lecturer, student, and anonymous users. |
| NFR-002 | Dashboard pages should load in under 2 seconds for 5,000 equipment records. | Performance smoke test with seeded data. |

## User Stories

- As STK-001, I want to see overdue equipment so I can follow up quickly.
- As STK-002, I want to know whether my request is pending, approved, or rejected.
- As STK-003, I want to approve requests in one queue so decisions are traceable.

## Acceptance Criteria

- AC-001: Given STK-001 opens the admin dashboard, when equipment is past its due date, then the item appears with borrower, due date, and status.
- AC-002: Given STK-002 submits a valid request, when the request is saved, then status is shown as pending.
- AC-003: Given STK-003 opens the approval queue, when a request needs approval, then approve and reject actions are available.
- AC-004: Given any tracked action occurs, when the action completes, then an audit event is stored with actor, timestamp, and action.
