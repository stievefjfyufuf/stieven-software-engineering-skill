# 03 Specification

## Artifact Contract

- Reads: `docs/software-engineering/01-inception.md` and `docs/software-engineering/02-elicitation.md`.
- Writes: `docs/software-engineering/03-specification.md`.
- Next consumers: steps 04-09 and 12-14 reuse its requirement and acceptance IDs.

## Functional Requirements

| ID | Requirement | Source | Acceptance Criteria |
|---|---|---|---|
| REQ-001 | The system shall show overdue borrowed equipment to lab admins. | NEED-001, GOAL-001 | AC-001 |
| REQ-002 | The system shall let students submit equipment borrowing requests. | NEED-002, GOAL-002 | AC-002 |
| REQ-003 | The system shall let lecturers approve or reject requests that require academic approval. | NEED-003, GOAL-003 | AC-003 |
| REQ-004 | The system shall record audit events for request, approval, borrow, and return actions. | NEED-004, GOAL-003 | AC-004 |
| REQ-005 | The system shall let lab admins issue approved equipment with a due date and record its return. | NEED-005, GOAL-001 | AC-005 |

## Non-Functional Requirements

| ID | Requirement | Evaluation |
|---|---|---|
| NFR-001 | Only authorized roles can access admin and approval functions. | Permission tests cover admin, lecturer, student, and anonymous users. |
| NFR-002 | Dashboard pages should load in under 2 seconds for 5,000 equipment records. | Performance smoke test with seeded data. |

## User Stories

- As STK-001, I want to see overdue equipment so I can follow up quickly.
- As STK-002, I want to know whether my request is pending, approved, or rejected.
- As STK-003, I want to approve requests in one queue so decisions are traceable.
- As STK-001, I want to record issue and return events so overdue status is based on the actual borrowing lifecycle.

## Acceptance Criteria

- AC-001: Given STK-001 opens the admin dashboard, when an active borrowing record is past its recorded due date, then the item appears with borrower, due date, and status.
- AC-002: Given STK-002 submits a valid request, when the request is saved, then status is shown as pending.
- AC-003: Given STK-003 opens the approval queue, when a request needs approval, then approve and reject actions are available.
- AC-004: Given any tracked action occurs, when the action completes, then an audit event is stored with actor, timestamp, and action.
- AC-005: Given an approved request, when STK-001 issues and later receives the equipment, then the borrowing record stores issued time, due date, returned time, and current status.
