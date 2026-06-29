---
name: 04-se-prioritization
description: Menentukan prioritas dan menyelesaikan konflik kebutuhan. Use when ordering backlog items, applying MoSCoW or value-risk-effort tradeoffs, resolving stakeholder conflicts, deciding MVP scope, or sequencing work for final-project and enterprise delivery.
---

# Prioritization

## Purpose

Use this skill to menentukan prioritas dan menyelesaikan konflik kebutuhan.


## Skill Docs

Before producing this skill's artifact, read `references/skill-docs.md` and apply its procedure, output template, traceability IDs, quality checklist, and handoff guidance.

## Inputs

Requirement set, stakeholder goals, constraints, deadlines, risks.

## Required Upstream Artifacts

- Before starting, open and read `docs/software-engineering/01-inception.md` and `docs/software-engineering/03-specification.md`.
- Treat them as the source of truth for stakeholder goals, constraints, `REQ`, `NFR`, and `AC` IDs; preserve those IDs in every priority decision.
- If either required artifact is missing, do not invent priorities or requirements. Ask for equivalent approved input or run the missing upstream skill first.
- Worked example chain: `examples/campus-inventory/01-inception.md` + `examples/campus-inventory/03-specification.md` -> `examples/campus-inventory/04-prioritization.md`.

## Workflow

- Nilai setiap requirement berdasarkan value, risk, effort, dependency, urgency, dan compliance impact.
- Gunakan MoSCoW atau priority score jika cocok.
- Identifikasi konflik antar stakeholder atau requirement.
- Negosiasikan scope agar kedua sisi mendapatkan hasil yang realistis.
- Pisahkan MVP, next release, dan deferred scope.

## Output

Prioritized backlog, conflict log, rationale, MVP boundary, deferred items.

## Artifact Persistence

- When executing this workflow, save the completed Markdown artifact to `docs/software-engineering/04-prioritization.md` in the user's project.
- Create `docs/software-engineering/` when it does not exist. Do not treat a chat response as the final artifact.
- Reopen the saved file to verify it exists and contains the completed output, then report its exact path to the user.
- Preserve an approved baseline unless a change is authorized and recorded through `16-se-change-log-engineering-loop`.
- Use the saved file as the source of truth for the handoff. If the user requests explanation or review only, do not create or modify the artifact.

## Handoff

Kirim prioritized backlog dan conflict log ke 05-se-validation-change.

## Quality Rules

- Keep the work scoped to this skill's single responsibility.
- Preserve traceability to stakeholder goals, requirements, issues, tests, or change requests.
- For enterprise-scale work, call out risk, ownership, dependency, compliance, security, and rollback concerns when relevant.
- Do not overwrite existing baseline artifacts unless the user explicitly asks for replacement and the change is logged.
