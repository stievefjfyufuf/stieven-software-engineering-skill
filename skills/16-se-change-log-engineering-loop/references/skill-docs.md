# 16 Change Log dan Engineering Loop Skill Docs

## When To Use

Gunakan saat PRD, design, code, test, atau app sudah punya baseline lalu user meminta perubahan, bug fix, tambahan fitur, refactor, atau koreksi release.

## Required Inputs

- User change request, defect report, stakeholder feedback, or production issue.
- Current baseline artifacts: PRD/spec, design, code, tests, release/deployment notes.
- Known affected IDs such as `REL`, `REQ`, `ISSUE`, `TEST`, or `UAT`.

## Step Procedure

1. Assign `CR-###` and capture requester, request, reason, type, urgency, and baseline affected.
2. Compare before/after behavior against the current baseline before proposing edits.
3. Perform impact analysis across requirements, design, database/API, UI, issues, code, tests, acceptance, deployment, docs, and operations.
4. Classify the change as bug fix, feature addition, behavior change, removal, refactor, hotfix, rollback, or breaking change.
5. Define approved scope and explicit not-in-scope items.
6. Define the approval gate: owner, required evidence, decision status, and date if known.
7. Decide routing: specification/design issue, implementation-only bug fix, testing-only gap, deployment correction, rollback, or full loop.
8. Define verification needed and rollback/compatibility concerns.
9. Route only to affected skills, then update baseline after review/test/acceptance/deployment succeeds.

## Output Template

```markdown
# Change Request

## Change ID

CR-###

## Request

## Reason

## Type

Feature addition / Behavior change / Bug fix / Removal / Refactor / Hotfix / Rollback / Breaking change

## Urgency

Low / Normal / High / Emergency

## Baseline Affected

REL-###

## Impact Analysis

| Artifact | Affected? | Before | After | Change Needed | Risk |
|---|---|---|---|---|---|

## Approved Scope

## Not In Scope

## Approval Gate

| Owner | Required Evidence | Decision | Notes |
|---|---|---|---|

## Before

## After

## Verification Needed

## Rollback and Compatibility

## Baseline Update Rule

Update the baseline only after routed work passes the required review, test, acceptance, and deployment checks.

## Routing Decision

Send to skill(s):
```

## Traceability IDs

- Use `CR-###` for every baseline-affecting change request.
- Link `CR` to affected `REL`, `REQ`, `AC`, `ISSUE`, `TEST`, `UAT`, `API`, `UI`, or `DATA` IDs.

## Mini Example

```markdown
## Change ID
CR-001

## Request
Add role-based approval before equipment can be borrowed.

## Routing Decision
Send to skill(s): 03-se-specification, 07-se-database-api-design, 08-se-ui-design, 09-se-issue-planning.

## Approval Gate
Owner: Product owner and lab admin. Required evidence: updated REQ/AC, API/UI impact notes, test plan. Decision: Pending.
```

## Quality Checklist

- Perubahan masuk sebagai Change Request.
- Baseline dibandingkan sebelum edit.
- Affected dan unaffected artifacts jelas.
- Approved scope membatasi perubahan.
- Before/After dan verification needed dicatat.
- Approval gate dan baseline update rule jelas.
- Rollback/compatibility dicatat untuk perubahan yang menyentuh deployment, data, API, atau behavior existing.

## Handoff

Route hanya ke skill terdampak, lalu setelah lolos review/test/acceptance update baseline.

## Common Mistakes To Avoid

- Do not skip traceability.
- Do not rewrite a baseline artifact outside the approved scope.
- Do not mix this step with unrelated downstream implementation work.
- Do not hide conflicts, assumptions, or unresolved questions.
