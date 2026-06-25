# Contributing

Thank you for improving this skill pack. The goal is to keep every skill practical, traceable, and safe for real software engineering work.

## Contribution Rules

- Keep each skill scoped to one workflow responsibility.
- Update both `SKILL.md` and `references/skill-docs.md` when behavior changes.
- Keep `agents/openai.yaml` prompts concise, but specific enough to drive high-quality artifacts.
- Preserve traceability IDs from upstream artifacts to downstream artifacts.
- Update `examples/campus-inventory/` when a change affects workflow handoff, required output, or ID usage.
- Update `README.md` when adding, removing, or renaming an ID prefix, skill, validation rule, or install instruction.
- Update `CHANGELOG.md` for user-visible changes.

## Quality Bar

Before opening a pull request or publishing changes:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/validate-skills.ps1
```

The validator should pass without local-only assumptions. If a validation rule is too strict, improve the rule and explain why in the changelog.

## Prompt Style

Agent prompts should be short enough to scan, but deep enough to improve generated app quality. Prefer prompts that require:

- reading the detailed skill docs;
- preserving traceability IDs;
- exposing ambiguity, risk, and trade-offs;
- producing the expected artifact template;
- recording verification or handoff evidence.

Avoid generic prompts such as "make requirements" or "write tests" without quality criteria.
