# 09 Issue Planning

## Issues

### ISSUE-001: Implement student borrow request submission

Traceability: REQ-002, AC-002, API-002, UI-002.

Acceptance:

- Student can submit a valid request.
- Invalid date range is rejected.
- Audit event is written.

### ISSUE-002: Implement lecturer approval queue

Traceability: REQ-003, AC-003, API-003, API-004, UI-003.

Acceptance:

- Lecturer sees pending requests.
- Lecturer can approve or reject.
- Unauthorized roles cannot access approval actions.

### ISSUE-003: Implement admin overdue dashboard

Traceability: REQ-001, AC-001, API-001, UI-001.

Acceptance:

- Admin sees overdue equipment with borrower and due date.
- Non-admin roles are denied.

## Dependencies

- DEP-001: ISSUE-002 depends on ISSUE-001.
- DEP-002: ISSUE-003 depends on request and borrow status data from ISSUE-001.
