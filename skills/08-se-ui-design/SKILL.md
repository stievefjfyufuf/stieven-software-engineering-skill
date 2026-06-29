---
name: 08-se-ui-design
description: Membuat halaman, navigasi, form, dan wireframe. Use when designing screens, navigation, user flows, form fields, UI states, wireframes, interaction behavior, empty/error/loading states, and acceptance-ready user experience.
---

# UI Design

## Purpose

Use this skill to membuat rancangan ui yang sesuai kebutuhan pengguna.


## Skill Docs

Before producing this skill's artifact, read `references/skill-docs.md` and apply its procedure, output template, traceability IDs, quality checklist, and handoff guidance.

## Inputs

User stories, acceptance criteria, API contract, domain flow, target users.

## Required Upstream Artifacts

- Before starting, open and read `docs/software-engineering/03-specification.md`, `docs/software-engineering/04-prioritization.md`, and `docs/software-engineering/07-database-api-design.md`.
- Treat user stories, accepted scope, acceptance criteria, and API behavior as the source of truth. Preserve `REQ`, `AC`, and `API` IDs in screen and state definitions.
- If a required artifact is missing or the API cannot support a required flow, do not hide the gap in UI assumptions; route it upstream.
- Worked example chain: steps 03, 04, and 07 in `examples/campus-inventory/` -> `examples/campus-inventory/08-ui-design.md`.

## Workflow

- Turunkan screen dari user stories dan workflow pengguna.
- Buat navigation map dan primary user flow.
- Rancang form fields, validation, empty/loading/error/success states.
- Pastikan UI mendukung acceptance criteria dan role permission.
- Gunakan wireframe text atau diagram sederhana sebelum coding UI.

## Output

Screen list, navigation flow, form specs, wireframe description, UI states, validation messages.

## Artifact Persistence

- When executing this workflow, save the completed Markdown artifact to `docs/software-engineering/08-ui-design.md` in the user's project.
- Create `docs/software-engineering/` when it does not exist. Do not treat a chat response as the final artifact.
- Reopen the saved file to verify it exists and contains the completed output, then report its exact path to the user.
- Preserve an approved baseline unless a change is authorized and recorded through `16-se-change-log-engineering-loop`.
- Use the saved file as the source of truth for the handoff. If the user requests explanation or review only, do not create or modify the artifact.

## Handoff

Kirim UI flow dan screen specs ke 09-se-issue-planning.

## Quality Rules

- Keep the work scoped to this skill's single responsibility.
- Preserve traceability to stakeholder goals, requirements, issues, tests, or change requests.
- For enterprise-scale work, call out risk, ownership, dependency, compliance, security, and rollback concerns when relevant.
- Do not overwrite existing baseline artifacts unless the user explicitly asks for replacement and the change is logged.
