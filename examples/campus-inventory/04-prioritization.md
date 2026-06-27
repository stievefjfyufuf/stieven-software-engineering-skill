# 04 Prioritization

## Prioritized Backlog

| Requirement ID | Value | Risk | Effort | Dependency | Priority | Rationale |
|---|---:|---:|---:|---|---|---|
| REQ-002 | 5 | 2 | 3 | None | Must | Borrow requests are the start of the workflow. |
| REQ-003 | 4 | 3 | 3 | REQ-002 | Must | Approval controls policy and accountability. |
| REQ-005 | 5 | 3 | 3 | REQ-002, REQ-003 | Must | Issue and return records provide the source of truth for active borrowing. |
| REQ-001 | 5 | 2 | 2 | REQ-005 | Must | Overdue visibility directly supports GOAL-001. |
| REQ-004 | 4 | 3 | 2 | REQ-002, REQ-003 | Should | Auditability supports operational trust. |

## Conflict Log

- DEC-001: Email notifications are deferred because dashboard visibility is enough for MVP.
- DEC-002: Export reporting is deferred until audit records stabilize.
