# Skill Test Prompts

Use these prompts after installing the skill pack to confirm each skill is discoverable and produces the expected artifact type.

## 01 Inception and Stakeholder

```text
Use 01-se-inception-stakeholder for this app idea: a campus inventory system for lab equipment used by students, lab admins, and lecturers.
```

## 02 Elicitation

```text
Use 02-se-elicitation. Stakeholders are lab admin, student borrower, lecturer, and IT support. Prepare interview questions and identify likely raw needs.
```

## 03 Specification

```text
Use 03-se-specification to convert these needs into functional requirements, NFRs, user stories, acceptance criteria, and traceability IDs: lab admin needs overdue visibility, students need request status, lecturers need approval oversight.
```

## 04 Prioritization

```text
Use 04-se-prioritization for these requirements: request equipment, approve request, show overdue items, export audit report, and send overdue notifications.
```

## 05 Validation and Change

```text
Use 05-se-validation-change to check whether these requirements are clear, testable, feasible, and ready for design.
```

## 06 Architecture Design

```text
Use 06-se-architecture-design for a web app with admin dashboard, student request flow, role-based approvals, PostgreSQL database, and email notifications.
```

## 07 Database and API Design

```text
Use 07-se-database-api-design to design tables and API contracts for equipment, users, requests, approvals, borrowing records, and audit logs.
```

## 08 UI Design

```text
Use 08-se-ui-design to design the admin overdue dashboard, student request form, lecturer approval queue, and empty/error/loading states.
```

## 09 Issue Planning

```text
Use 09-se-issue-planning to break the validated requirements, API contract, and UI screens into GitHub-ready implementation issues.
```

## 10 Implementation

```text
Use 10-se-implementation for ISSUE-001: implement overdue equipment listing for lab admins linked to REQ-001 and AC-001.
```

## 11 Code Review

```text
Use 11-se-code-review to review this diff for security, regression, missing tests, and traceability to ISSUE-001.
```

## 12 Test Planning

```text
Use 12-se-test-planning to create a risk-based test plan for the overdue dashboard and approval workflow.
```

## 13 Automated Testing

```text
Use 13-se-automated-testing to add or update automated tests for overdue filtering, role permissions, and API error handling.
```

## 14 Acceptance Testing

```text
Use 14-se-acceptance-testing to create a UAT checklist for lab admins, students, and lecturers before release.
```

## 15 Deployment

```text
Use 15-se-deployment to prepare release REL-001 with build checks, migration plan, smoke tests, rollback plan, and production verification.
```

## 16 Change Log and Engineering Loop

```text
Use 16-se-change-log-engineering-loop. Baseline REL-001 exists, and I want to add role-based approval before equipment can be borrowed.
```
