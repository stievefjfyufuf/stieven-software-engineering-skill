# 09 Issue Planning

## Artifact Contract

- Reads: `docs/software-engineering/03-specification.md` through `docs/software-engineering/08-ui-design.md`.
- Writes: `docs/software-engineering/09-issue-planning.md`.
- Next consumers: steps 10-12 and 15 use selected issue scope and linked IDs.

## Issues

### ISSUE-001: Implement student borrow request submission

Traceability: REQ-002, REQ-004, AC-002, AC-004, API-002, UI-002.

Acceptance:

- Student can submit a valid request.
- Invalid date range is rejected.
- Audit event is written.

### ISSUE-002: Implement lecturer approval queue

Traceability: REQ-003, REQ-004, AC-003, AC-004, API-003, API-004, UI-003.

Acceptance:

- Lecturer sees pending requests.
- Lecturer can approve or reject.
- Unauthorized roles cannot access approval actions.
- Approval decision writes an audit event.

### ISSUE-003: Implement admin overdue dashboard

Traceability: REQ-001, AC-001, API-001, UI-001.

Acceptance:

- Admin sees overdue equipment with borrower and due date.
- Non-admin roles are denied.

### ISSUE-004: Implement equipment issue and return lifecycle

Traceability: REQ-004, REQ-005, AC-004, AC-005, API-005, API-006, UI-004, DATA-005.

Acceptance:

- Lab admin can issue an approved request with a due date.
- Lab admin can record a return.
- Issue and return actions write audit events.

## Dependencies

- DEP-001: ISSUE-002 depends on ISSUE-001.
- DEP-002: ISSUE-004 depends on ISSUE-001 and ISSUE-002.
- DEP-003: ISSUE-003 depends on active borrowing data from ISSUE-004.
