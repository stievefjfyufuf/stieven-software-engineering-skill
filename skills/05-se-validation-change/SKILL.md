---
name: 05-se-validation-change
description: Memeriksa requirement dan menganalisis perubahan awal. Use when validating requirements with stakeholders, checking completeness and consistency, reviewing acceptance criteria, handling early requirement changes, or deciding whether a requirement is ready for design.
---

# Validation dan Change

## Purpose

Use this skill to memeriksa requirement dan menganalisis perubahan awal.


## Skill Docs

Before producing this skill's artifact, read `references/skill-docs.md` and apply its procedure, output template, traceability IDs, quality checklist, and handoff guidance.

## Inputs

Prioritized requirements, acceptance criteria, conflict log, stakeholder feedback.

## Required Upstream Artifacts

- Before starting, open and read `docs/software-engineering/02-elicitation.md`, `docs/software-engineering/03-specification.md`, and `docs/software-engineering/04-prioritization.md`.
- Treat them as the source of truth for stakeholder evidence, requirements, acceptance criteria, conflicts, priorities, and `DEC` IDs; preserve upstream IDs in each validation finding.
- If a required artifact is missing, do not declare the requirements ready. Ask for equivalent approved input or run the missing upstream skill first.
- Worked example chain: steps 02-04 in `examples/campus-inventory/` -> `examples/campus-inventory/05-validation-change.md`.

## Workflow

- Periksa requirement: clear, complete, consistent, feasible, testable, and traceable.
- Bandingkan acceptance criteria dengan kebutuhan stakeholder.
- Tandai requirement yang duplicate, conflicting, vague, atau terlalu besar.
- Untuk perubahan awal, catat reason, impact, dan decision.
- Nyatakan apakah requirement siap masuk design atau harus kembali ke elicitation/specification.

## Output

Validated requirement set, rejected/changed items, issue list, readiness decision.

## Artifact Persistence

- When executing this workflow, save the completed Markdown artifact to `docs/software-engineering/05-validation-change.md` in the user's project.
- Create `docs/software-engineering/` when it does not exist. Do not treat a chat response as the final artifact.
- Reopen the saved file to verify it exists and contains the completed output, then report its exact path to the user.
- Preserve an approved baseline unless a change is authorized and recorded through `16-se-change-log-engineering-loop`.
- Use the saved file as the source of truth for the handoff. If the user requests explanation or review only, do not create or modify the artifact.

## Handoff

Jika valid, kirim ke 06-se-architecture-design. Jika belum, kembali ke 02-se-elicitation atau 03-se-specification.

## Quality Rules

- Keep the work scoped to this skill's single responsibility.
- Preserve traceability to stakeholder goals, requirements, issues, tests, or change requests.
- For enterprise-scale work, call out risk, ownership, dependency, compliance, security, and rollback concerns when relevant.
- Do not overwrite existing baseline artifacts unless the user explicitly asks for replacement and the change is logged.
