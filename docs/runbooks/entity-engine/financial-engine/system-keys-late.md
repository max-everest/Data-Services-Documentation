# Runbook: Financial System Keys — Late Processing

## Overview

| Runbook: | Financial System Keys — Late Processing |
| --- | --- |
| Data Contract: | |
| Purpose: | Triage and resolution for alerts when system keys are processed late (records in `EEHub.dbo.FinancialEngineSystemKeysLate`). |
| Context: | This runbook is used when the monitoring workflow queries `EEHub.dbo.FinancialEngineSystemKeysLate` and raises a P3 (or higher) alert. The Power Automate monitor queries the view and notifies the Data Engineering inbox and Flow bot when records are found. |
| Systems: | Entity Engine → Financial Engine → EEAPI |
| When to use: | Use this runbook when the monitoring service reports one or more rows in `EEHub.dbo.FinancialEngineSystemKeysLate` indicating late processing. |

### Issue Severity

| Level | Description | SLA |
| --- | ---- | --- |
| P1 Critical | Failure of whole service | 1 hr SLA |
| P2 Urgent | Failures of multiple records | 3 hr SLA |
| P3 High | Single or few late records requiring triage | 1 day SLA |
| P4 Medium | Data Quality issues | 3 day SLA |
| P5 Low | Service degraded but operational | 1 week SLA |

### Ownership
| Role | Who |
|---|---|
| Runbook Owner: | Head of Data Services |
| Technical Team: | Data Engineering |

--------------------------------------------------


## Quick Triage

| Issue | Expectation | Symptom | Action |
|-----|-----|-----|-----|
| Monitoring alert (one or more records) | P3/P2/P1 depending on volume and context | One or more rows in `EEHub.dbo.FinancialEngineSystemKeysLate` where `LastCapturedDate` is older than the expected cadence | Run diagnostics below and determine scope. |
| Multiple late records or large volume | P2 / P1 | Large number of keys behind schedule affecting downstream processing | Escalate to Data Owner and Business Owner; follow escalation steps. |
| Single late key | P3 | Isolated late processing for a specific key | Validate source and pipeline processing; track to resolution. |
| No records in monitoring table but business reports missing outputs | Investigate processing | Monitoring table clear, but consumers report missing data | Check Entity Engine processing, capture views, and downstream outputs. |

--------------------------------------------------


## Diagnostics

| Issue Type | Diagnostic | How |
|-----|-----|-----|
| Monitoring workflow | Verify Power Automate run history | Check the Power Automate run history for the Financial System Keys monitor and inspect the `GetItems_V2` step output. |
| Validate records | Query monitoring table | `SELECT TOP 100 * FROM [EEHub].[dbo].[FinancialEngineSystemKeysLate] ORDER BY LastCapturedDate DESC` — confirm `LastCapturedDate` values and row count. |
| Source validation | Confirm source capture times | Query source/ingest tables used by the Financial Engine for the affected keys. |
| Entity Engine processing | Check Entity Engine capture/audit views and logs | Inspect recent job runs, capture views and any failed job messages for the affected entity. |
| Downstream validation | Verify downstream consumers | Confirm whether downstream views or integrations show the missing/late keys. |
| Failure audit | Check analytics/audit table | Review `Analytics.dbo.aud.Error` for entries created by the monitor failure path or related processing faults. |

**Quick SQL snippets**

```
-- Check monitoring table
SELECT TOP 100 *
FROM [EEHub].[dbo].[FinancialEngineSystemKeysLate]
ORDER BY LastCapturedDate DESC;

-- Check analytics audit table for relevant errors
SELECT TOP 100 *
FROM [Analytics].[dbo].[aud.Error]
WHERE [Event] LIKE '%DataEngineeringMonitor-FinancialSystemKeys%'
ORDER BY Logged DESC;
```

--------------------------------------------------


## Escalation

| Scenario | Escalate To | Criteria |
|-----|-----|-----|
| Service failure or widespread lateness | Technical Team (Data Engineering), Data Owner, Business Owner | Immediate — P1/P2 impact |
| Multiple late keys affecting many records | Data Owner, Business Owner | P2 — escalate within 3 hours |
| Single late key unresolved after triage | Data Engineering → Data Owner | P3 — escalate within 1 day if not resolved |
| Data quality breach | Data Owner | Breach exceeds tolerance |
| Out of hours | On-call Data Engineering | Initial triage by on-call; notify stakeholders during business hours unless P1 or month-end impact |

--------------------------------------------------


## Communication

Notify stakeholders using structured updates and the cadence appropriate to severity.

| Audience | Phase | Message | Channel |
|-----|-----|-----|-----|
| Team | Investigation | The Financial System Keys monitor flagged late processing at <time>. Investigation underway. | MS Teams |
| Data Owner & Business Owner | Investigation (P1/P2) | Financial System Keys processing delayed at <time>. Investigation in progress. | Email |
| Data Owner & Business Owner | Identification | Root cause identified; remediation underway. | Email |
| Data Owner & Business Owner | Resolution | Processing resumed and late keys reprocessed. Summary and actions provided. | Email |

**Default notification recipients (from monitor):** dlitfdst@rsmuk.com (Data Engineering inbox), max.everest@rsmuk.com (Flow bot chat). Modify as required.

--------------------------------------------------


## References & Commands

- Monitoring table: `EEHub.dbo.FinancialEngineSystemKeysLate`
- Audit table: `Analytics.dbo.aud.Error`
- Power Automate monitor name: `DataEngineeringMonitor-FinancialSystemKeys` (queries the view and posts notifications)
- Follow Entity Engine runbook for reprocessing instructions and capture view validation.


## File

Path: content/runbooks/entity-engine/financial-engine/system-keys-late.md
