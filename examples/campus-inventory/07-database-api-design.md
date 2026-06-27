# 07 Database and API Design

## Data Entities

| ID | Entity | Key Fields | Traceability |
|---|---|---|---|
| DATA-001 | equipment | id, name, category, status, restricted, created_at | REQ-002 |
| DATA-002 | borrow_requests | id, requester_id, equipment_id, status, needed_from, needed_until | REQ-002, REQ-003 |
| DATA-003 | approvals | id, request_id, approver_id, decision, comment, decided_at | REQ-003 |
| DATA-004 | audit_events | id, actor_id, action, target_type, target_id, created_at | REQ-004 |
| DATA-005 | borrowing_records | id, request_id, issued_by, issued_at, due_at, returned_at, status | REQ-001, REQ-005 |

## API Contracts

| ID | Method | Path | Purpose | Auth | Traceability |
|---|---|---|---|---|---|
| API-001 | GET | `/api/admin/overdue` | List overdue equipment | Lab admin | REQ-001, AC-001 |
| API-002 | POST | `/api/requests` | Submit borrow request | Student | REQ-002, AC-002 |
| API-003 | GET | `/api/approvals` | List approval queue | Lecturer | REQ-003, AC-003 |
| API-004 | POST | `/api/approvals/{id}/decision` | Approve or reject request | Lecturer | REQ-003, AC-003 |
| API-005 | POST | `/api/requests/{id}/issue` | Issue approved equipment with a due date | Lab admin | REQ-005, AC-005 |
| API-006 | POST | `/api/borrowing-records/{id}/return` | Record equipment return | Lab admin | REQ-005, AC-005 |

## Migration Notes

- Add indexes on `borrow_requests.status`, `borrow_requests.needed_until`, and `equipment.status`.
- Add an index on `borrowing_records(status, due_at)` for the overdue query.
- Store audit events append-only.
