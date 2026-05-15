# Contract Review Checklist

## Review Categories

Findings must be categorised as:

| Severity | Meaning |
|---|---|
| Critical | Blocks production use |
| High | Should be fixed before approval |
| Medium | Should be fixed but does not block initial review |
| Low | Minor quality or consistency issue |
| Suggestion | Improvement opportunity |

## Business Review

Check:

- Purpose is clear.
- Business problem is stated.
- In scope and out of scope are explicit.
- Intended usage is clear.
- Limitations are stated.
- Success measures are measurable.
- Business owner is defined.
- Data owner is defined.
- SME is defined.
- Consumers are identified.

## Technical Review

Check:

- Fabric location is defined.
- Source systems are identified.
- Target table/path is identified.
- Schema is complete.
- Field descriptions are business-readable.
- Required fields are marked.
- Critical data elements are marked.
- Data types are defined.
- Business rules are captured.
- Transformations are described.
- Dependencies are listed.

## Quality Review

Check:

- Quality rules exist.
- Each rule has a severity.
- Each rule has an owner.
- Each rule is testable.
- Critical data elements have checks.
- Freshness/latency is covered.
- Reconciliation is covered where possible.
- Warning vs error rules are justified.

## Operational Review

Check:

- Refresh SLA is defined.
- Latency SLA is defined.
- Expected duration is defined.
- Cutoff logic is defined.
- Monitoring signals exist.
- Alert policy is defined.
- Support channel is defined.
- Diagnostics are actionable.
- Escalation path is defined.
- Recovery validation exists.

## Governance Review

Check:

- Approval status is correct.
- Approvers are listed.
- Change process is defined.
- Version history is present.
- Review cadence is present.
- Sign-off status is explicit.

## Website Readiness

Check:

- Overview page can be generated.
- Schema page can be generated.
- Controls page can be generated.
- Operations page can be generated.
- Broken links are not present.
- TBC values are listed in Known Gaps.
