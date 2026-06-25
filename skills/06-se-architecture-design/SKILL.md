---
name: 06-se-architecture-design
description: Menentukan bagian utama aplikasi dan keputusan arsitektur. Use when designing system structure, modules, components, service boundaries, deployment shape, quality attributes, architecture decisions, or tradeoffs before database/API/UI design.
---

# Architecture Design

## Purpose

Use this skill to menentukan bagian utama aplikasi dan keputusan arsitektur.

## Inputs

Validated requirements, NFRs, constraints, expected scale, integration needs.

## Workflow

- Pilih style arsitektur yang sesuai: monolith, modular monolith, client-server, service-based, or microservices only when justified.
- Bagi sistem menjadi components/modules dengan responsibilities yang jelas.
- Hubungkan architecture decisions ke requirement dan NFR.
- Tentukan data flow, external integrations, authentication boundary, and deployment assumptions.
- Catat tradeoff dan risk sebagai architecture decision record.

## Output

Architecture overview, component map, ADR notes, data flow, integration boundaries, risk notes.

## Handoff

Kirim component map dan data flow ke se-database-api-design.

## Quality Rules

- Keep the work scoped to this skill's single responsibility.
- Preserve traceability to stakeholder goals, requirements, issues, tests, or change requests.
- For enterprise-scale work, call out risk, ownership, dependency, compliance, security, and rollback concerns when relevant.
- Do not overwrite existing baseline artifacts unless the user explicitly asks for replacement and the change is logged.
