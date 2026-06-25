---
name: 12-se-test-planning
description: Membuat rencana pengujian. Use when designing test strategy, test scenarios, coverage matrix, test data, risk-based testing, unit/integration/e2e scope, regression checks, and validation plan before writing automated tests.
---

# Test Planning

## Purpose

Use this skill to membuat rencana pengujian yang traceable.


## Skill Docs

Before producing this skill's artifact, read `references/skill-docs.md` and apply its procedure, output template, traceability IDs, quality checklist, and handoff guidance.

## Inputs

Requirements, acceptance criteria, issue, architecture, implementation notes, risks.

## Workflow

- Map acceptance criteria ke test scenarios.
- Pisahkan unit, integration, e2e, manual, performance, security, and regression tests sesuai risiko.
- Tentukan test data dan boundary cases.
- Prioritaskan test untuk behavior berisiko tinggi dan critical flow.
- Tandai bagian yang tidak bisa diotomasi dan perlu manual verification.

## Output

Test strategy, scenario list, coverage matrix, test data, regression checklist.

## Handoff

Kirim test plan ke 13-se-automated-testing.

## Quality Rules

- Keep the work scoped to this skill's single responsibility.
- Preserve traceability to stakeholder goals, requirements, issues, tests, or change requests.
- For enterprise-scale work, call out risk, ownership, dependency, compliance, security, and rollback concerns when relevant.
- Do not overwrite existing baseline artifacts unless the user explicitly asks for replacement and the change is logged.
