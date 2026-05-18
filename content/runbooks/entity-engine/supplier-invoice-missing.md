# Runbook: Workday Supplier Invoice Missing

## Overview

| Runbook: | Workday Supplier Invoice Missing |
| --- | --- |
| Data Contract: | workday_supplier_invoice |
| Related documentation: | [Workday Supplier Invoice](../../data-contracts/workday/workday-supplier-invoice/index.md) |
| Purpose: | Triage and resolution for alerts where supplier invoices expected in the curated supplier-invoice target are missing from the integration flow and are therefore not available for downstream supplier-invoice processing. |
| Context: | This runbook is used when monitoring detects missing supplier invoices and raises a P3 (or higher) alert. The monitoring workflow queries `EEHub.dbo.WorkdaySupplierInvoiceMissing` and notifies the Data Engineering inbox when records are found. |
| Systems: | Workday -> Data Engine -> FinancialEngine (`Invoice11`) -> EEAPI -> `Invoice11_PASO` |
| When to use: | Use this runbook when the monitoring service reports one or more records in `EEHub.dbo.WorkdaySupplierInvoiceMissing` or when users report supplier invoices missing from `Invoice11_PASO`. |

### Issue Severity

The importance of this process grows over the accounting period and when within 5 working days of the month end should be managed to the SLA one level above.

| Level | Description | SLA |
| --- | ---- | --- |
| P1 Critical | Failure of whole service | 1 hr SLA |
| P2 Urgent | Failures of multiple records | 3 hr SLA |
| P3 High | Single error record | 1 day SLA |
| P4 Medium | Data Quality issues | 3 day SLA |
| P5 Low | Service is impacted but working | 1 week SLA |

### Ownership

| Role | Who |
|---|---|
| Data Architect: | Phil Howard |
| Data Owner: | Max Everest |
| Business Owner: | Brett Healey |
| Technical Team: | Data Engineering Team |

--------------------------------------------------

## Quick Triage

| Issue | Expectation | Symptom | Action |
|-----|-----|-----|-----|
| Monitoring alert (one or more records) | P3/P2/P1 depending on volume and context | One or more rows in `EEHub.dbo.WorkdaySupplierInvoiceMissing` | Run diagnostics below and determine scope. |
| Multiple missing supplier invoices or large volume | P2 / P1 | Large number of supplier invoices missing from downstream outputs | Escalate to Data Owner and Business Owner; follow escalation steps. |
| Single missing supplier invoice | P3 | Isolated missing supplier invoice in monitoring output | Validate source and pipeline processing; track to resolution. |
| No records in monitoring table but users report missing supplier invoices | Investigate processing | Monitoring table clear, but consumers cannot find supplier invoices | Check supplier-invoice processing and publish logs. |

--------------------------------------------------

## Diagnostics

| Issue Type | Diagnostic | How |
|-----|-----|-----|
| Monitoring workflow | Verify workflow run history | Check the supplier-invoice monitor run history and inspect inputs and outputs for the table query step. |
| Validate missing supplier invoices | Query missing-invoice table | `SELECT TOP 100 * FROM [EEHub].[dbo].[WorkdaySupplierInvoiceMissing] ORDER BY [invoiceDate] DESC` |
| Source validation | Confirm supplier invoice exists in source | Query `DataEngine.dbo.WorkdayDataStaging_in_Invoice` and `DataEngine.dbo.WorkdayDataStaging_in_InvoiceLines` for the affected `OurRef` and `LineID`. |
| Target validation | Confirm supplier invoice absent in target | Query `FinancialEngine.out.Invoice11` for the affected supplier invoice reference. |
| Failure audit | Check analytics audit table | Review `Analytics.aud.Error` for entries created by the failure path. |

--------------------------------------------------

## Escalation

| Scenario | Escalate To | Criteria |
|-----|-----|-----|
| Service failure / data unavailable | Technical Team (Data Engineering), Data Owner, Business Owner | Immediate - P1 or widespread impact |
| Multiple missing supplier invoices affecting many records | Data Owner, Business Owner | P2 - escalate within 3 hours |
| Single missing supplier invoice | Data Engineering -> Data Owner | P3 - escalate within 1 day if not resolved |
| Data quality issues | Data Owner | P4 - escalate within 3 days |

--------------------------------------------------

## Communication

| Audience | Phase | Message | Channel |
|-----|-----|-----|-----|
| Team | Investigation | The supplier-invoice missing monitor indicated an error at <time>. I am currently investigating and will raise a bug. | MS Teams |
| Business Owner & Data Owner | Investigation (P1) | The supplier-invoice integration service is failing as of <time>. We are currently investigating and will update you at <time>. | Email |
| Business Owner & Data Owner | Resolution (P1) | The supplier-invoice integration service has been restored. Any relevant outcomes from our debrief will be shared. | Email |
| Data Owner | Investigation (P2/P3/P4/P5) | The supplier-invoice integration service indicated missing supplier invoices at <time>. We are investigating and will update you at <time>. | Email |

--------------------------------------------------

## References & Commands

- Monitoring table: `EEHub.dbo.WorkdaySupplierInvoiceMissing`
- Source tables: `DataEngine.dbo.WorkdayDataStaging_in_Invoice`, `DataEngine.dbo.WorkdayDataStaging_in_InvoiceLines`
- Target table: `FinancialEngine.out.Invoice11`
- Audit table: `Analytics.dbo.aud.Error`

## Related Documentation

- [Workday Supplier Invoice Data Contract](../../data-contracts/workday/workday-supplier-invoice/index.md)
- [Contract Operations](../../data-contracts/workday/workday-supplier-invoice/operations.md)

## File

Path: content/runbooks/entity-engine/supplier-invoice-missing.md