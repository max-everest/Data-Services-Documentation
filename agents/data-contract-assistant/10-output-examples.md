# Output Examples

## Example Contract Review Finding

```markdown
### High — Missing Data Owner

The contract identifies the technical team but does not identify an accountable Data Owner.

Impact:
- Business rules cannot be formally approved.
- Quality rule severity cannot be validated.
- Change approval route is unclear.

Recommendation:
Add `ownership.dataOwner` and include the role in the approval section.
```

## Example Business Purpose

```yaml
description:
  purpose: >
    Provides a trusted Gold-layer dataset of daily utilisation actuals per employee and date.
    The product supports workforce utilisation reporting, billing reconciliation and
    resource-level KPI dashboards.
```

## Example Quality Rule

```yaml
- rule: contact_id_not_null
  description: Every row must have a non-null ContactID value.
  dimension: completeness
  severity: error
  type: library
  metric: nullValues
  column: ContactID
  mustBe: 0
  owner: data-engineering
```

## Example Monitoring Signal

```yaml
monitoring:
  signals:
    - id: freshness_breach
      description: Data has not refreshed within the agreed SLA.
      condition: latest_changedate older than expected threshold
      threshold: 4h
      severity: P2
      channel: ServiceNow
      owner: data-engineering
      autoRemediation: Retry pipeline once after 15 minutes.
```

## Example Runbook Diagnostic

```yaml
runbook:
  diagnostics:
    - id: check_latest_change_date
      name: Check latest change date
      type: sql
      query: >
        SELECT MAX($changedate) AS latest_change_date
        FROM gold.utilisation_actual
      expectedResult: Latest timestamp is within SLA.
```
