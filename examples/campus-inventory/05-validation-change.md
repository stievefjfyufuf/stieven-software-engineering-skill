# 05 Validation and Change

## Artifact Contract

- Reads: `docs/software-engineering/02-elicitation.md`, `docs/software-engineering/03-specification.md`, and `docs/software-engineering/04-prioritization.md`.
- Writes: `docs/software-engineering/05-validation-change.md`.
- Next consumers: steps 06, 07, and 09 use only scope marked ready.

## Validation Findings

- VAL-001: REQ-001 is testable because Q-002 defines overdue from an active borrowing record and recorded due date.
- VAL-002: REQ-003 needs a policy answer for which equipment requires lecturer approval.
- VAL-003: NFR-001 is measurable through role permission tests.
- VAL-004: REQ-005 supplies the issue, due-date, and return lifecycle required by REQ-001.

## Readiness Decision

Ready for design: Yes, with Q-001 tracked as a design constraint.

## Changed or Rejected Items

- DEC-003: Email notifications remain out of MVP scope.

## Handoff

Send validated requirements, Q-001, and DEC-003 to `06-se-architecture-design`.
