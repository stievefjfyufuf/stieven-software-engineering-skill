# 01 Inception and Stakeholder

## Problem Statement

Campus lab staff cannot reliably track which student borrowed which equipment, when it is due, and who approved the borrowing. This creates lost equipment, manual follow-ups, and weak auditability.

## Goals

- GOAL-001: Reduce lost or overdue lab equipment by improving borrow and return visibility.
- GOAL-002: Give students a clear request and status flow.
- GOAL-003: Give lecturers and lab admins traceable approval and audit records.

## Stakeholders

| ID | Stakeholder | Role | Needs | Influence |
|---|---|---|---|---|
| STK-001 | Lab Admin | Operational owner | Manage equipment, approvals, overdue returns | High |
| STK-002 | Student | Borrower | Request equipment and see request status | Medium |
| STK-003 | Lecturer | Academic approver | Approve usage for class or project work | Medium |
| STK-004 | IT Support | Technical operator | Maintain auth, backups, and deployment | Medium |

## Scope

### In Scope

- Equipment catalog.
- Borrow request flow.
- Approval workflow.
- Borrow and return tracking.
- Overdue dashboard.
- Basic audit history.

### Out of Scope

- RFID scanning.
- Payment or fines.
- Multi-campus stock transfer.

## Assumptions

- ASSUMP-001: Campus identity provider can supply user roles.
- ASSUMP-002: Lab admins own final policy decisions for overdue handling.

## Open Questions

- Q-001: Should lecturer approval be required for every request or only restricted equipment?
- Q-002: What is the official overdue definition?
