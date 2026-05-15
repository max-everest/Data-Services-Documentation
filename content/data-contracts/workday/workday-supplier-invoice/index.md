# Workday Supplier Invoice

| Field | Value |
|---|---|
| Domain | Finance |
| Data Product | Workday Supplier Invoice |
| Contract Version | 0.1.0 |
| Status | Draft |
| Owner | Max Everest |
| Last Updated | 2026-05-15 |

## Overview

This draft contract describes the `Invoice11` supplier-invoice entity in FinancialEngine. The entity combines Workday supplier invoice headers and lines with client, engagement, and phase enrichment and adds derived flags for credit notes and adjustments.

The current draft includes named business, data, architecture, SME, and support ownership. It remains in `draft` status and is not approved or active.

## Business Context

| Topic | Summary |
|---|---|
| Purpose | Provide a governed supplier-invoice dataset for downstream financial integration and reporting |
| Business Problem | Downstream consumers should not need to reimplement parsing, lookup, and adjustment logic to use Workday supplier invoice data safely |
| In Scope | Workday supplier invoice headers and lines, client and engagement enrichment, phase resolution, invoice reference derivations, and adjustment flags |
| Out of Scope | Client-invoice integration logic, Workday source creation workflows, VAT derivation without a confirmed source, currency normalisation, consumer-specific presentation rules |

## Source To Target Summary

| Area | Detail |
|---|---|
| Primary Sources | `DataEngine.dbo.WorkdayDataStaging_in_Invoice` and `DataEngine.dbo.WorkdayDataStaging_in_InvoiceLines` |
| Lookup Sources | `ClientEngine.out.SystemKeys10`, `EngagementEngine.out.SingleEngagementView10`, `EngagementEngine.out.Phase11`, `FinancialEngine.out.AdjustedInvoices10` |
| Target | `FinancialEngine.out.Invoice11` |
| Consumers | `Invoice11_PASO` |

## Processing Summary

1. Read Workday supplier invoice headers.
2. Join supplier invoice lines by `OurRef`.
3. Parse `EngSeqNum` to resolve client, engagement, and phase identifiers.
4. Derive invoice number, credit note status, and adjustment status.
5. Publish the curated supplier-invoice entity to `FinancialEngine.out.Invoice11`.

## Operating Model

| Topic | Value |
|---|---|
| Product Owner | Brett Healey |
| Business Owner | Brett Healey |
| Data Owner | Max Everest |
| Data Architect | Phil Howard |
| Source SME | Kelly Oliver |
| Technical Owner | Data Engineering team |
| Support Owner | Data Engineering team |
| Trigger | Scheduled |
| Schedule | At every 15th minute from 10 through 59 past every hour from 4 through 22 |
| Expected Duration | 1 minute |
| Cutoff | 10 minutes |

## Related Pages

| Page | Purpose |
|---|---|
| [schema.md](schema.md) | Field definitions and critical data elements |
| [controls.md](controls.md) | Quality rules, SLA properties, and monitoring controls |
| [operations.md](operations.md) | Operational support, diagnostics, and escalation |

## Confirmation Required

| Role | Required Decision |
|---|---|
| Data Owner | Confirm whether `VatAmount`, `CurrencyCode`, and `ChangeDate` should remain contractual fields while currently null |
| Data Architect | Confirm the authoritative workspace value and target freshness evidence source |
| Support Owner | Confirm the freshness threshold, dashboard, and any out-of-hours escalation channel |
| SME | Confirm supplier-invoice monitoring table names and adjustment semantics |

## Known Gaps

| Gap | Impact | Required Action | Owner |
|---|---|---|---|
| VAT, currency, and change tracking fields are null placeholders | Consumers may assume unsupported fields are populated | Confirm whether these fields are placeholders or planned enhancements | Data Owner / SME |
| Evidence location and dashboard remain `TBC` | Monitoring and quality evidence cannot yet be audited end to end | Confirm evidence store and dashboard | Data Architect / Support Owner |
| Target freshness query remains `TBC` | Freshness incidents cannot be triaged consistently | Confirm the query or monitoring source for latest successful publish | Support Owner / Technical Owner |