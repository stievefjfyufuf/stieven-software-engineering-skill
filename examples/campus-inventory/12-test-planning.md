# 12 Test Planning

## Test Matrix

| ID | Acceptance Criteria | Type | Scenario | Traceability |
|---|---|---|---|---|
| TEST-001 | AC-001 | Integration | Admin sees overdue equipment after due date passes. | REQ-001, ISSUE-003 |
| TEST-002 | AC-001, NFR-001 | Authorization | Student cannot call admin overdue API. | REQ-001, ISSUE-003 |
| TEST-003 | AC-002 | Integration | Student submits valid request and sees pending status. | REQ-002, ISSUE-001 |
| TEST-004 | AC-003 | Integration | Lecturer approves pending request. | REQ-003, ISSUE-002 |

## Risk-Based Focus

- Permission failures are high risk because they expose admin data.
- Date boundary handling is medium risk because overdue behavior depends on policy.
