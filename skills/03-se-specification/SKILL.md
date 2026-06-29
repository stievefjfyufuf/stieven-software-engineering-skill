---
name: 03-se-specification
description: Membuat functional requirement, non-functional requirement, user story, dan acceptance criteria. Use when converting elicited needs into structured requirements, PRD sections, user stories, acceptance criteria, constraints, and traceable specification artifacts.
---

# Specification

## Purpose

Use this skill to membuat requirement terstruktur dan dapat diuji.


## Skill Docs

Before producing this skill's artifact, read `references/skill-docs.md` and apply its procedure, output template, traceability IDs, quality checklist, and handoff guidance.

## Inputs

Raw needs, stakeholder answers, goals, ambiguity list, domain rules.

## Required Upstream Artifacts

- Before starting, open and read `docs/software-engineering/01-inception.md` and `docs/software-engineering/02-elicitation.md`.
- Treat them as the source of truth for goals, stakeholders, assumptions, constraints, `NEED` items, answers, conflicts, and unresolved questions; preserve all upstream IDs.
- If either required artifact is missing, do not silently infer it. Ask for equivalent approved input or run the missing upstream skill first.
- Worked example chain: `examples/campus-inventory/01-inception.md` + `examples/campus-inventory/02-elicitation.md` -> `examples/campus-inventory/03-specification.md`.

## Workflow

- Ubah kebutuhan menjadi functional requirement yang spesifik.
- Tulis non-functional requirement untuk quality attributes seperti reliability, security, usability, performance, maintainability, dan scalability.
- Buat user story dengan format actor, action, value.
- Tulis acceptance criteria yang observable dan testable.
- Tambahkan traceability dari goal atau stakeholder ke requirement.

## Output

Functional requirements, non-functional requirements, user stories, acceptance criteria, traceability notes.

## Artifact Persistence

- When executing this workflow, save the completed Markdown artifact to `docs/software-engineering/03-specification.md` in the user's project.
- Create `docs/software-engineering/` when it does not exist. Do not treat a chat response as the final artifact.
- Reopen the saved file to verify it exists and contains the completed output, then report its exact path to the user.
- Preserve an approved baseline unless a change is authorized and recorded through `16-se-change-log-engineering-loop`.
- Use the saved file as the source of truth for the handoff. If the user requests explanation or review only, do not create or modify the artifact.

## Handoff

Kirim requirement set ke 04-se-prioritization.

## Quality Rules

- Keep the work scoped to this skill's single responsibility.
- Preserve traceability to stakeholder goals, requirements, issues, tests, or change requests.
- For enterprise-scale work, call out risk, ownership, dependency, compliance, security, and rollback concerns when relevant.
- Do not overwrite existing baseline artifacts unless the user explicitly asks for replacement and the change is logged.
