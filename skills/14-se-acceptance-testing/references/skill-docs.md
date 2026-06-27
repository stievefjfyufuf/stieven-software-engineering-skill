# 14 Acceptance Testing Skill Docs

## When To Use

Gunakan saat alur lengkap pengguna perlu divalidasi sebelum deploy atau ketika stakeholder memberi feedback UAT.

## Required Inputs

- Acceptance criteria, user flow, implemented feature, and automated test results.
- Deployment candidate or local/staging environment.
- Stakeholder role or acceptance owner when available.

## Step Procedure

1. Convert each acceptance criterion into a UAT checklist item with `UAT-###` ID.
2. Execute the main user journey, important edge cases, permission checks, and failure states.
3. Capture evidence: environment, account/role, data used, command/browser result, screenshot/log reference when available.
4. Mark each item pass, fail, blocked, or not tested with reason.
5. Separate defects from stakeholder feedback or new change requests.
6. Decide accepted, rejected, accepted with follow-up, or blocked.
7. If accepted, send to `15-se-deployment`. If rejected before the first approved baseline, route the defect to `10-se-implementation` or the affected upstream skill and repeat the applicable review and test steps. Use `16-se-change-log-engineering-loop` only when feedback changes an approved baseline or records intentionally deferred new scope.

## Output Template

```markdown
# Acceptance Testing

## User Flow

## UAT Checklist

- [ ]

## Evidence

## Defects

## Feedback

## Decision

Accepted / Accepted with Notes / Rejected

## Follow-up
```

## Traceability IDs

- Use `UAT-###` for acceptance checklist items.
- Link each `UAT` to `AC`, `REQ`, `ISSUE`, and `TEST` where possible.

## Mini Example

```markdown
## UAT Checklist
- [x] UAT-001 / AC-001: Admin can view overdue equipment.
- [ ] UAT-002 / AC-002: Non-admin is denied access.

## Decision
Rejected until UAT-002 passes.
```

## Quality Checklist

- Checklist berasal dari acceptance criteria.
- Happy path dan edge case penting diuji.
- Evidence/hasil dicatat.
- Accepted/rejected decision jelas.

## Handoff

Jika accepted, lanjut ke 15-se-deployment. Jika rejected sebelum baseline pertama, route defect ke 10-se-implementation atau skill upstream yang terdampak lalu ulangi gate yang relevan. Gunakan 16-se-change-log-engineering-loop hanya untuk perubahan terhadap approved baseline atau scope baru yang ditunda.

## Common Mistakes To Avoid

- Do not skip traceability.
- Do not rewrite a baseline artifact outside the approved scope.
- Do not mix this step with unrelated downstream implementation work.
- Do not hide conflicts, assumptions, or unresolved questions.
