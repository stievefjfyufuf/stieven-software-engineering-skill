# 06 Architecture Design

## Component Map

| ID | Component | Responsibility | Traceability |
|---|---|---|---|
| COMP-001 | Web UI | Student, lecturer, and admin screens | REQ-001, REQ-002, REQ-003, REQ-005 |
| COMP-002 | API Server | Auth checks, workflow rules, data access | REQ-001, REQ-002, REQ-003, REQ-004, REQ-005, NFR-001 |
| COMP-003 | Database | Equipment, requests, approvals, borrowing records, audit logs | REQ-001, REQ-004, REQ-005 |

## ADRs

### ADR-001: Use a modular monolith for MVP

Context: The MVP has shared workflow data and a small team.

Decision: Build one deployable app with separated modules for equipment, requests, approvals, and audit.

Consequences: Lower delivery and deployment complexity now; service extraction can be revisited after usage grows.

## Data Flow

Student submits request -> API validates role and equipment -> lecturer approves if required -> lab admin issues equipment -> return event closes borrow record -> dashboard reports overdue records.
