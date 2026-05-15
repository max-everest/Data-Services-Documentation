# Workday Supplier Invoice

| Field | Value |
|---|---|
| Domain | Finance |
| Data Product | Workday Supplier Invoice |
| Contract Version | 0.1.0 |
| Status | Draft |
| Owner | Max Everest |
| Last Updated | 2026-05-15 |

## Data Quality Rules

| Rule ID | Description | Dimension | Severity | Type | Owner | Status |
|---|---|---|---|---|---|---|
| workday_reference_not_blank | WorkdayReference must be populated | completeness | error | library | Data Engineering | Draft |
| amount_without_vat_not_null | AmountWithoutVat must be populated | completeness | error | library | Data Engineering | Draft |
| client_resolution_review | Missing ClientKey values require review | integrity | warning | library | Data Engineering | Draft |
| adjustment_reference_consistency | Adjusted invoices should carry an adjusted reference | consistency | warning | sql | Data Engineering | Draft |
| refresh_within_agreed_sla | Latest successful refresh should remain within SLA | timeliness | warning | observability | Data Engineering | Draft |

## SLA Properties

| SLA Property | Draft Value | Notes |
|---|---|---|
| Refresh Frequency | 15 minutes | Contract refresh frequency for the curated entity |
| Latency | 60 minutes | Maximum allowed latency from upstream readiness to target availability |
| Retention | 7 years | Retention expectation for the curated entity |

## Support Response SLAs

| Incident Class | Response Target | Notes |
|---|---|---|
| P1 Urgent incidents | 60 minutes | Failure of the whole service or critical data issues impacting month-end processes |
| P3 High incidents | 1 business day | Partial service degradation or data issues impacting non-critical processes |
| P5 Low incidents | 5 business days | Limited-impact issues or cases where a workaround is available |

## Monitoring Controls

| Signal | Threshold | Severity | Source | Notes |
|---|---|---|---|---|
| Missing supplier invoice alert | 24 hours | P3 | `EEHub.dbo.WorkdaySupplierInvoiceMissing` | Supplier-invoice monitoring control |
| Supplier invoice mismatch alert | 90 minutes | P3 | `dbo.EntityEngineSupplierInvoiceMismatch` | Supplier-invoice mismatch monitoring control |
| Entity freshness breach | TBC | P3 | `FinancialEngine.out.Invoice11` | Threshold still needs to be set in the monitoring section |

## Evidence And Validation

| Control Area | Evidence Location |
|---|---|
| Quality rule execution | TBC |
| Missing supplier invoice monitoring | `EEHub.dbo.WorkdaySupplierInvoiceMissing` |
| Supplier invoice mismatch monitoring | `dbo.EntityEngineSupplierInvoiceMismatch` |
| Incident evidence | `Analytics.aud.Error` and incident records |
| Dashboard | TBC |

## Confirmation Required

| Role | Required Decision |
|---|---|
| Data Owner | Confirm whether warning-level client resolution and adjustment checks should remain warnings |
| Support Owner | Confirm evidence location, dashboard, and freshness threshold |
| SME | Confirm the supplier-invoice monitoring tables and operational semantics |

## Known Gaps

| Gap | Impact | Required Action | Owner |
|---|---|---|---|
| Evidence store for quality rules is not confirmed | Quality enforcement cannot yet be audited end to end | Confirm audit location and notebook or pipeline implementation | Data Architect / Technical Owner |
| Freshness threshold remains `TBC` | The timeliness control cannot be executed consistently | Confirm the agreed freshness threshold | Support Owner / Data Owner |