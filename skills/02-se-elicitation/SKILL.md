---
name: 02-se-elicitation
description: Menyusun pertanyaan dan menemukan kebutuhan stakeholder. Use when gathering requirements through interviews, surveys, workshops, observation, document analysis, or when project needs are still incomplete, ambiguous, or stakeholder-driven.
---

# Elicitation

## Purpose

Use this skill to menyusun pertanyaan dan menemukan kebutuhan stakeholder.


## Skill Docs

Before producing this skill's artifact, read `references/skill-docs.md` and apply its procedure, output template, traceability IDs, quality checklist, and handoff guidance.

## Inputs

Stakeholder map, goals, assumptions, open questions, domain context.

## Required Upstream Artifacts

- Before starting, open and read `docs/software-engineering/01-inception.md`.
- Treat it as the source of truth for `GOAL`, `STK`, `ASSUMP`, constraints, scope, and open questions; preserve those IDs in the elicitation artifact.
- If it is missing, do not silently recreate it. Ask for equivalent approved input or run `01-se-inception-stakeholder` first.
- Worked example chain: `examples/campus-inventory/01-inception.md` -> `examples/campus-inventory/02-elicitation.md`.

## Workflow

- Kelompokkan pertanyaan berdasarkan stakeholder dan tujuan.
- Gunakan teknik interview, survey, workshop, observation, dan document analysis sesuai konteks.
- Bedakan kebutuhan eksplisit, kebutuhan tersembunyi, constraint, dan pain point.
- Tandai jawaban yang masih ambigu atau bertentangan.
- Ringkas kebutuhan awal tanpa mengubahnya menjadi solusi teknis terlalu cepat.

## Output

Question bank, elicitation plan, raw needs, stakeholder answers, unresolved ambiguity.

## Artifact Persistence

- When executing this workflow, save the completed Markdown artifact to `docs/software-engineering/02-elicitation.md` in the user's project.
- Create `docs/software-engineering/` when it does not exist. Do not treat a chat response as the final artifact.
- Reopen the saved file to verify it exists and contains the completed output, then report its exact path to the user.
- Preserve an approved baseline unless a change is authorized and recorded through `16-se-change-log-engineering-loop`.
- Use the saved file as the source of truth for the handoff. If the user requests explanation or review only, do not create or modify the artifact.

## Handoff

Kirim raw needs dan ambiguity list ke 03-se-specification.

## Quality Rules

- Keep the work scoped to this skill's single responsibility.
- Preserve traceability to stakeholder goals, requirements, issues, tests, or change requests.
- For enterprise-scale work, call out risk, ownership, dependency, compliance, security, and rollback concerns when relevant.
- Do not overwrite existing baseline artifacts unless the user explicitly asks for replacement and the change is logged.
