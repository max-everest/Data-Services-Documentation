# YAML Style Guide

## General Rules

- YAML is the canonical source of truth.
- Keep YAML structured and concise.
- Avoid long prose where a linked markdown document is better.
- Use stable IDs for rules, SLAs, diagnostics and controls.
- Use lowercase snake_case for technical IDs.
- Use business-readable descriptions.
- Use `TBC` only where information is genuinely unknown.
- Do not mark contract status as `active` without approval.

## Naming

Use:

```yaml
name: gold_utilisation_actual
domain: financial_data_hub
dataProduct: utilisation_actual
```

Avoid:

```yaml
name: Gold Utilisation Actual - Final v2
```

## Rule IDs

Use clear rule IDs:

```yaml
rule: contact_id_not_null
rule: billable_hours_non_negative
rule: row_count_positive
```

Avoid vague IDs:

```yaml
rule: check_1
rule: validation_test
```

## Severity

Use:

```yaml
severity: error
severity: warning
severity: information
```

Meaning:

| Severity | Meaning |
|---|---|
| error | Fails the contract and should stop or quarantine processing |
| warning | Allows processing but requires review |
| information | Captured for observability or trend monitoring |

## Critical Data Elements

A critical data element is a field that materially affects business trust, downstream processing, financial reporting, regulatory reporting, or operational decision-making.

Example:

```yaml
criticalDataElement: true
```

## Quality Rules

Library rule example:

```yaml
- rule: contact_id_not_null
  description: Every row must have a non-null ContactID value.
  dimension: completeness
  severity: error
  type: library
  metric: nullValues
  column: ContactID
  mustBe: 0
```

SQL rule example:

```yaml
- rule: standard_hours_range
  description: StandardHours must be between 0 and 24 for every row.
  dimension: accuracy
  severity: error
  type: sql
  query: >
    SELECT COUNT(*)
    FROM gold.utilisation_actual
    WHERE StandardHours < 0 OR StandardHours > 24
  mustBe: 0
```

## Custom Properties

Use `customProperties` only when there is no suitable native field.

Good use:

```yaml
customProperties:
  - property: upstreamDependency
    value:
      table: silver.dim_date
      stalenessCheck: existence
      minRowCount: 1
```

Poor use:

```yaml
customProperties:
  - property: notes
    value: Lots of unstructured text...
```
