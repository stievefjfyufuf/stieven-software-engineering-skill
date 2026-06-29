---
name: 16-se-change-log-engineering-loop
description: Mencatat perubahan, impact analysis, approved scope, dan menjaga baseline. Use when a PRD, design, codebase, test suite, or deployed app already exists and the user requests a change, bug fix, addition, removal, refactor, scope adjustment, or release correction that must preserve existing baseline artifacts.
---

# Change Log dan Engineering Loop

## Purpose

Use this skill to mengatur perubahan tanpa merusak baseline PRD, design, code, test, atau app yang sudah stabil.


## Skill Docs

Before producing this skill's artifact, read `references/skill-docs.md` and apply its procedure, output template, traceability IDs, quality checklist, and handoff guidance.

## Inputs

User change request, current baseline, PRD/design/code/test/deployment artifacts, stakeholder feedback.

## Required Upstream Artifacts

- Before analyzing a change, open and read `docs/software-engineering/15-deployment.md` and every affected baseline artifact under `docs/software-engineering/01-inception.md` through `docs/software-engineering/14-acceptance-testing.md`. Read the existing `docs/software-engineering/16-change-request.md` and matching `docs/software-engineering/changes/CR-###.md` when continuing an existing request.
- Treat the latest approved `REL` and affected artifacts as the baseline. Preserve all affected IDs and assign one stable `CR` ID before routing work.
- If no approved baseline exists, do not fabricate one; use the normal pre-baseline skill flow instead. If an affected artifact is missing, record the gap in impact analysis before approval.
- Worked example chain: `examples/campus-inventory/15-deployment.md` -> `examples/campus-inventory/16-change-request.md` + `examples/campus-inventory/changes/CR-001.md`.

## Workflow

- Catat permintaan sebagai Change Request dengan id, request, reason, type, urgency, and requester if known.
- Bandingkan request dengan baseline: PRD, requirement, architecture, database, API, UI, code, tests, and deployment.
- Buat impact analysis: affected artifacts, unaffected artifacts, risk, dependency, and possible conflicts.
- Klasifikasikan perubahan: bug fix, feature addition, behavior change, removal, refactor, hotfix, rollback, atau breaking change.
- Tentukan approved scope: bagian yang boleh diubah dan bagian yang tidak boleh disentuh.
- Tetapkan approval gate: siapa yang harus menyetujui dan evidence apa yang wajib ada sebelum baseline berubah.
- Tulis change log dengan Before, After, Reason, Impact, Risk, Verification Needed.
- Route pekerjaan hanya ke skill yang terdampak; jangan rewrite PRD/app penuh untuk perubahan kecil.

## Output

Change request, impact analysis, approval gate, change log, approved scope, affected artifacts, verification plan, rollback/compatibility notes, routing decision.

## Artifact Persistence

- When executing this workflow, save the change-control index to `docs/software-engineering/16-change-request.md` and each detailed request to `docs/software-engineering/changes/CR-###.md` using its assigned CR ID.
- Create both directories when they do not exist. Do not treat a chat response as the final artifact.
- Append or update the matching CR entry without deleting earlier history or overwriting an approved baseline.
- Reopen both saved files to verify the CR ID, before/after behavior, impact, approval, scope, verification, rollback, and routing are recorded, then report their exact paths.
- Use the saved CR file as the source of truth for routed work. If the user requests explanation or review only, do not create or modify the artifacts.

## Handoff

Kirim approved scope ke skill terdampak: specification, design, issue planning, implementation, testing, atau deployment.

## Quality Rules

- Keep the work scoped to this skill's single responsibility.
- Preserve traceability to stakeholder goals, requirements, issues, tests, or change requests.
- For enterprise-scale work, call out risk, ownership, dependency, compliance, security, and rollback concerns when relevant.
- Update the baseline only after the routed work has passed review, testing, acceptance, and deployment checks that apply to the change.
- Do not overwrite existing baseline artifacts unless the user explicitly asks for replacement and the change is logged.
