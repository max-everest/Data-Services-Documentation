# Quality Rule Guide

## Purpose

Quality rules define how the contract is enforced.

Each quality rule should be:

- specific,
- testable,
- owned,
- severity-rated,
- linked to business impact where possible.

## Quality Dimensions

| Dimension | Meaning |
|---|---|
| completeness | Required data is present |
| uniqueness | Duplicate records do not exist |
| validity | Values conform to expected formats or domains |
| accuracy | Values are logically correct |
| consistency | Values agree across fields or systems |
| timeliness | Data is available within expected timeframes |
| integrity | Relationships and references are valid |

## Rule Types

| Type | Usage |
|---|---|
| library | Standard reusable rule interpreted by the notebook framework |
| sql | Custom SQL rule returning a measurable result |
| reconciliation | Rule comparing source and target totals |
| dependency | Rule checking upstream availability |
| observability | Rule captured for trend monitoring |

## Severity Model

| Severity | Behaviour |
|---|---|
| error | Fail pipeline or quarantine invalid records |
| warning | Allow pipeline but raise alert/review item |
| information | Record metric only |

## Rule Template

```yaml
- rule:
  description:
  dimension:
  severity:
  type:
  owner:
  evidence:
```

## Recommended Minimum Rules

Every production contract should consider:

1. Row count greater than zero
2. Required critical data elements not null
3. Primary/business key uniqueness
4. Date/timestamp validity
5. Negative value checks for measures where inappropriate
6. Range checks for bounded numeric fields
7. Referential checks to key dimensions
8. Freshness check
9. Reconciliation check where source totals are available
10. Schema drift detection

## Business Impact Prompt

For each rule, the assistant should ask:

> If this rule fails, what decision, process, report, or downstream system is affected?

The answer should inform severity.
