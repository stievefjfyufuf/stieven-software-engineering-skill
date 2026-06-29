# 16 Change Request Index

## Artifact Contract

- Reads: `docs/software-engineering/15-deployment.md`, every affected step 01-14 baseline artifact, and prior change records when present.
- Writes: `docs/software-engineering/16-change-request.md` plus `docs/software-engineering/changes/CR-###.md`.
- Next consumers: only the affected routed skills read the approved CR scope before changing the baseline.

This index preserves the change history after the `REL-001` baseline. Detailed requests live under `changes/` and are the source of truth for routed work.

| Change ID | Baseline | Type | Summary | Approval | Detail |
|---|---|---|---|---|---|
| CR-001 | REL-001 | Feature addition | Add overdue email reminders. | Pending | `changes/CR-001.md` |

## Baseline Rule

Keep REL-001 unchanged until CR-001 passes its approval gate and all routed review, testing, acceptance, and deployment checks.
