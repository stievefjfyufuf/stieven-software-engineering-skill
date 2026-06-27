# 12 Test Planning

## Test Matrix

| ID | Acceptance Criteria | Type | Scenario | Traceability |
|---|---|---|---|---|
| TEST-001 | AC-001 | Integration | Admin sees overdue equipment after due date passes. | REQ-001, ISSUE-003 |
| TEST-002 | AC-001, NFR-001 | Authorization | Student cannot call admin overdue API. | REQ-001, ISSUE-003 |
| TEST-003 | AC-002 | Integration | Student submits valid request and sees pending status. | REQ-002, ISSUE-001 |
| TEST-004 | AC-003 | Integration | Lecturer approves pending request. | REQ-003, ISSUE-002 |
| TEST-005 | AC-005 | Integration | Lab admin issues approved equipment and records its return. | REQ-005, ISSUE-004 |
| TEST-006 | AC-004 | Integration | Request, approval, issue, and return actions append audit events. | REQ-004, ISSUE-001, ISSUE-002, ISSUE-004 |
| TEST-007 | AC-001 | Boundary | An active borrowing record with due date equal to current time is not overdue until time advances past it. | REQ-001, ISSUE-003, FINDING-002 |

## Risk-Based Focus

- Permission failures are high risk because they expose admin data.
- Date boundary handling is medium risk because overdue behavior depends on policy.
- Borrowing lifecycle integrity is high risk because the overdue dashboard depends on active records and due dates.
