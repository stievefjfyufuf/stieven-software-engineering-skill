# Changelog

All notable changes to this skill pack should be documented in this file.

## Unreleased

- Fix pre-baseline UAT rejection routing so defects return to affected implementation/design work instead of incorrectly entering baseline change control.
- Require explicit authorization and a named environment before deployment execution against live or shared targets.
- Repair the campus example's stable question IDs and add the missing issue/return lifecycle, borrowing record, API/UI contracts, tests, UAT, and release traceability needed by the overdue workflow.
- Demonstrate both step 16 persisted artifacts with a change index and `changes/CR-001.md` detail record.
- Extend validation with canonical skill/path checks, Markdown integrity, prompt coverage, lifecycle prerequisites, and cross-step traceability gates.
- Require every executing workflow to persist a verified Markdown artifact under `docs/software-engineering/` instead of relying on chat-only output.
- Add canonical filenames for steps 01-16, companion implementation/testing records, and per-request `changes/CR-###.md` history.
- Extend validation to require artifact persistence, verification, and saved-path handoff rules in all skills.
- Strengthen all skill entry points so they require reading `references/skill-docs.md` before producing artifacts.
- Deepen all 16 agent prompts while keeping them concise and focused on traceability, quality gates, risk, verification, and handoff.
- Expand local validation to check root project files, agent prompt depth, required docs usage, example completeness, placeholder text, and example traceability prefixes.
- Add project contribution and licensing documents.

## 0.1.0

- Initial 16-skill enterprise software engineering workflow.
- Add campus inventory end-to-end example.
- Add local PowerShell validator for skill structure and traceability prefix registration.
