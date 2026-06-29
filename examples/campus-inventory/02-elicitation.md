# 02 Elicitation

## Artifact Contract

- Reads: `docs/software-engineering/01-inception.md`.
- Writes: `docs/software-engineering/02-elicitation.md`.
- Next consumer: step 03 reads steps 01 and 02 before specification.

## Question Bank

- Q-001 for STK-001 and STK-003: Should lecturer approval be required for every request or only restricted equipment?
- Q-002 for STK-001: What is the official overdue definition?
- Q-003 for STK-001: What fields are required to register equipment?
- Q-004 for STK-001: What actions should be available for overdue items?
- Q-005 for STK-002: What status updates do students expect after submitting a request?
- Q-006 for STK-004: What authentication and backup constraints apply?
- Q-007 for STK-001: Are email notifications required for MVP?

## Raw Needs

- NEED-001: Lab admins need to see overdue borrowed equipment. Source: STK-001, GOAL-001.
- NEED-002: Students need to submit borrowing requests and see approval status. Source: STK-002, GOAL-002.
- NEED-003: Lecturers need a queue for approval decisions. Source: STK-003, GOAL-003.
- NEED-004: IT support needs role-based access and audit logs. Source: STK-004, GOAL-003.
- NEED-005: Lab admins need to record equipment issue, due date, and return so overdue status is based on an active borrowing record. Source: STK-001, GOAL-001.

## Confirmed Answers

- Q-002: Equipment is overdue when its recorded due date has passed and no return has been recorded.

## Ambiguities

- Q-001: Whether approval is required for every item or only high-value/restricted items.
- Q-007: Whether email notifications are required for MVP.
