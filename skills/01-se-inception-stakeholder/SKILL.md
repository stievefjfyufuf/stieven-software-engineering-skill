---
name: 01-se-inception-stakeholder
description: Memahami masalah, tujuan, stakeholder, scope, asumsi, dan pertanyaan terbuka sebelum requirement detail dibuat. Use when starting a new software project, clarifying an app idea, defining project boundaries, identifying stakeholders, or preparing early discovery for final-project through enterprise-scale applications.
---

# Inception dan Stakeholder

## Purpose

Use this skill to memahami masalah, tujuan, stakeholder, scope, asumsi, dan pertanyaan terbuka.


## Skill Docs

Before producing this skill's artifact, read `references/skill-docs.md` and apply its procedure, output template, traceability IDs, quality checklist, and handoff guidance.

## Inputs

Ide aplikasi, konteks bisnis, target pengguna, masalah yang ingin diselesaikan, batasan awal.

## Required Upstream Artifacts

- No generated upstream artifact is required for a new project. Read the user's brief, assignment, existing notes, and any current project documentation before starting.
- If an existing approved baseline is present, do not replace it through this skill; route the requested revision through `16-se-change-log-engineering-loop`.
- Record unknown information as assumptions or open questions instead of inventing facts.
- Worked example output: `examples/campus-inventory/01-inception.md` when using this repository as the skill pack source.

## Workflow

- Nyatakan masalah utama dalam 1-3 kalimat.
- Identifikasi stakeholder primer, sekunder, dan pihak operasional.
- Pisahkan tujuan bisnis, tujuan pengguna, dan tujuan teknis.
- Tetapkan scope awal: in-scope, out-of-scope, constraint, dan asumsi.
- Tulis pertanyaan terbuka untuk dibawa ke elicitation.

## Output

Problem statement, stakeholder map, goals, in-scope/out-of-scope, assumptions, open questions.

## Artifact Persistence

- When executing this workflow, save the completed Markdown artifact to `docs/software-engineering/01-inception.md` in the user's project.
- Create `docs/software-engineering/` when it does not exist. Do not treat a chat response as the final artifact.
- Reopen the saved file to verify it exists and contains the completed output, then report its exact path to the user.
- Preserve an approved baseline unless a change is authorized and recorded through `16-se-change-log-engineering-loop`.
- Use the saved file as the source of truth for the handoff. If the user requests explanation or review only, do not create or modify the artifact.

## Handoff

Kirim open questions dan stakeholder map ke 02-se-elicitation.

## Quality Rules

- Keep the work scoped to this skill's single responsibility.
- Preserve traceability to stakeholder goals, requirements, issues, tests, or change requests.
- For enterprise-scale work, call out risk, ownership, dependency, compliance, security, and rollback concerns when relevant.
- Do not overwrite existing baseline artifacts unless the user explicitly asks for replacement and the change is logged.
