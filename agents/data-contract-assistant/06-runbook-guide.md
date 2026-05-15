# Runbook Guide

## Purpose

Runbooks support operational triage and resolution.

A runbook should help support teams answer:

1. What has gone wrong?
2. How serious is it?
3. What should I check first?
4. Who needs to know?
5. How do I resolve or escalate?
6. How do I confirm recovery?

## Standard Runbook Structure

```markdown
# Runbook: <Name>

## Overview

| Field | Value |
|---|---|
| Runbook |  |
| Data Contract |  |
| Purpose |  |
| Context |  |
| Systems |  |
| When to use |  |

## Issue Severity

| Level | Description | SLA |
|---|---|---|
| P1 Critical |  |  |
| P2 Urgent |  |  |
| P3 High |  |  |
| P4 Medium |  |  |
| P5 Low |  |  |

## Ownership

| Role | Who |
|---|---|
| Data Architect |  |
| Data Owner |  |
| Business Owner |  |
| Technical Team |  |
| Support Owner |  |

## Quick Triage

| Issue | Expectation | Symptom | Action |
|---|---|---|---|

## Diagnostics

| Issue Type | Diagnostic | How |
|---|---|---|

## Escalation

| Scenario | Escalate To | Criteria |
|---|---|---|

## Communication

| Audience | Phase | Message | Channel |
|---|---|---|---|

## Recovery Validation

| Check | Expected Result | Evidence |
|---|---|---|

## References and Commands

- Monitoring table:
- Source table:
- Target table:
- Audit table:
- Dashboard:
```

## Runbook Generation Rules

The assistant should generate runbooks from:

- `description.purpose`
- `ownership`
- `sources`
- `targets`
- `lineage`
- `slaProperties`
- `monitoring`
- `support`
- `runbook`

## Good Runbook Diagnostics

Diagnostics should be executable or directly actionable.

Good:

```sql
SELECT COUNT(*)
FROM gold.utilisation_actual
WHERE Date >= CURRENT_DATE() - 1
```

Poor:

```text
Check the data looks right.
```

## Communication Rules

Communication templates should be:

- concise,
- audience-specific,
- severity-aware,
- reusable during investigation, identification and resolution.
