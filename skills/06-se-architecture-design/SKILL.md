---
name: 06-se-architecture-design
description: Menentukan bagian utama aplikasi dan keputusan arsitektur. Use when designing system structure, modules, components, service boundaries, deployment shape, quality attributes, architecture decisions, or tradeoffs before database/API/UI design.
---

# Architecture Design

## Purpose

Use this skill to menentukan bagian utama aplikasi dan keputusan arsitektur.


## Skill Docs

Before producing this skill's artifact, read `references/skill-docs.md` and apply its procedure, output template, traceability IDs, quality checklist, and handoff guidance.

## Inputs

Validated requirements, NFRs, constraints, expected scale, integration needs.

## Required Upstream Artifacts

- Before starting, open and read `docs/software-engineering/03-specification.md` and `docs/software-engineering/05-validation-change.md`.
- Treat only requirements marked ready in step 05 as design inputs. Preserve `REQ`, `NFR`, `AC`, `VAL`, and `DEC` traceability in components and architecture decisions.
- If either required artifact is missing or readiness is `No`, do not finalize architecture. Route the work to the missing or blocked upstream step.
- Worked example chain: `examples/campus-inventory/03-specification.md` + `examples/campus-inventory/05-validation-change.md` -> `examples/campus-inventory/06-architecture-design.md`.

## Workflow

- Pilih style arsitektur yang sesuai: monolith, modular monolith, client-server, service-based, or microservices only when justified.
- Bagi sistem menjadi components/modules dengan responsibilities yang jelas.
- Hubungkan architecture decisions ke requirement dan NFR.
- Tentukan data flow, external integrations, authentication boundary, and deployment assumptions.
- Catat tradeoff dan risk sebagai architecture decision record.

## Output

Architecture overview, component map, ADR notes, data flow, integration boundaries, risk notes.

## Artifact Persistence

- When executing this workflow, save the completed Markdown artifact to `docs/software-engineering/06-architecture-design.md` in the user's project.
- Create `docs/software-engineering/` when it does not exist. Do not treat a chat response as the final artifact.
- Reopen the saved file to verify it exists and contains the completed output, then report its exact path to the user.
- Preserve an approved baseline unless a change is authorized and recorded through `16-se-change-log-engineering-loop`.
- Use the saved file as the source of truth for the handoff. If the user requests explanation or review only, do not create or modify the artifact.

## Handoff

Kirim component map dan data flow ke 07-se-database-api-design.

## Quality Rules

- Keep the work scoped to this skill's single responsibility.
- Preserve traceability to stakeholder goals, requirements, issues, tests, or change requests.
- For enterprise-scale work, call out risk, ownership, dependency, compliance, security, and rollback concerns when relevant.
- Do not overwrite existing baseline artifacts unless the user explicitly asks for replacement and the change is logged.
