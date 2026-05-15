# Workday Supplier Invoice

| Field | Value |
|---|---|
| Domain | Finance |
| Data Product | Workday Supplier Invoice |
| Contract Version | 0.1.0 |
| Status | Draft |
| Owner | Max Everest |
| Last Updated | 2026-05-15 |

## Schema

| Name | Description | Logical Type | Physical Type | Required | CDE | Source | Field Owner |
|---|---|---|---|---|---|---|---|
| ClientKey | Resolved warehouse client key joined from `EngSeqNum` and ClientEngine system keys | integer | int | No | Yes | `ClientEngine.out.SystemKeys10.ClientKey` | Phil Howard |
| ClientCode | Client code associated with the resolved client | string | varchar | No | Yes | `ClientEngine.out.SystemKeys10.ClientCode` | Phil Howard |
| EngagementKey | Resolved warehouse engagement key associated with the supplier invoice line | integer | int | No | Yes | `EngagementEngine.out.SingleEngagementView10.EngagementKey` | Phil Howard |
| EngagementCode | Source engagement sequence used by downstream processes | string | varchar | No | Yes | `EngagementEngine.out.SingleEngagementView10.PasoEngagementSequence` | Phil Howard |
| PhaseKey | Resolved warehouse phase key associated with the supplier invoice line | integer | int | No | Yes | `EngagementEngine.out.Phase11.$EntityKey` | Phil Howard |
| PhaseCode | Source phase code matched to the resolved phase | string | varchar | No | No | `EngagementEngine.out.Phase11.Code` | Phil Howard |
| Invoiced | Supplier invoice incurred date supplied by the source header | datetime | datetime | No | Yes | `DataEngine.dbo.WorkdayDataStaging_in_Invoice.IncurredDate` | Karl Rostock |
| Number | Derived supplier invoice number created from supplier code and supplier reference | string | varchar | No | Yes | Derived | Karl Rostock |
| InvoiceReceived | Source supplier invoice received date from the Workday header | datetime | datetime | No | Yes | `DataEngine.dbo.WorkdayDataStaging_in_Invoice.Date` | Karl Rostock |
| AmountWithoutVat | Supplier invoice line amount excluding VAT | decimal | decimal(18,2) | No | Yes | `DataEngine.dbo.WorkdayDataStaging_in_InvoiceLines.Amount` | Karl Rostock |
| VatAmount | VAT amount for the supplier invoice line | decimal | decimal(18,2) | No | Yes | Null placeholder | Phil Howard |
| CurrencyCode | Currency code for the supplier invoice amount | string | varchar(500) | No | Yes | Null placeholder | Phil Howard |
| ChangeDate | Change tracking timestamp for the supplier invoice row | datetime | datetime | No | No | Null placeholder | Phil Howard |
| IsCreditNote | Indicates whether the supplier invoice amount represents a credit note | boolean | bit | Yes | Yes | Derived from `InvoiceAmount` | Phil Howard |
| WorkdayReference | Workday supplier invoice reference from the source header | string | varchar | No | Yes | `DataEngine.dbo.WorkdayDataStaging_in_Invoice.OurRef` | Karl Rostock |
| WorkdayLineReference | Workday supplier invoice line reference from the source line | string | varchar | No | Yes | `DataEngine.dbo.WorkdayDataStaging_in_InvoiceLines.LineID` | Karl Rostock |
| DisbursementType | Disbursement classification provided on the source supplier invoice line | string | varchar | No | No | `DataEngine.dbo.WorkdayDataStaging_in_InvoiceLines.DisbursementType` | Karl Rostock |
| AdjustedWorkdayReference | Reference to the Workday supplier invoice adjusted by the current invoice | string | varchar | No | Yes | `DataEngine.dbo.WorkdayDataStaging_in_Invoice.Supplier_Inv_Ref_for_Adjustment` | Karl Rostock |
| IsAdjusted | Indicates whether the supplier invoice participates in an adjustment chain | boolean | bit | Yes | Yes | Derived from source and `FinancialEngine.out.AdjustedInvoices10` | Phil Howard |

## Critical Data Elements

| Field | Why It Is Critical |
|---|---|
| ClientKey | Determines client attribution and downstream finance context |
| ClientCode | Supports client identity and traceability |
| EngagementKey | Determines engagement attribution and downstream reporting |
| EngagementCode | Preserves the source engagement reference used by consumers |
| PhaseKey | Supports phase-level allocation where available |
| Invoiced | Anchors supplier-invoice timing and period analysis |
| Number | Human-readable supplier invoice identifier used in support and reconciliation |
| InvoiceReceived | Supports timeliness and operational tracking |
| AmountWithoutVat | Core monetary measure for the entity |
| VatAmount | Required for full financial interpretation if later populated |
| CurrencyCode | Required for correct monetary interpretation if later populated |
| IsCreditNote | Controls treatment of negative-value invoices |
| WorkdayReference | Primary source supplier-invoice identifier |
| WorkdayLineReference | Primary source supplier-invoice line identifier |
| AdjustedWorkdayReference | Links invoices within an adjustment chain |
| IsAdjusted | Controls adjustment logic and reconciliation behaviour |

## Transformation Notes

| Field | Transformation |
|---|---|
| ClientKey | Derived by parsing the first `EngSeqNum` segment and matching `ClientCode` |
| EngagementKey | Derived by parsing the second `EngSeqNum` segment and joining with `ClientKey` |
| PhaseKey | Derived from the third `EngSeqNum` segment when present |
| Number | `SupplierCode + '_' + SupplierRef` |
| IsCreditNote | `CASE WHEN InvoiceAmount < 0 THEN 1 ELSE 0 END` |
| AdjustedWorkdayReference | Blank strings converted to null |
| IsAdjusted | True when either source or lookup adjustment reference exists |
| VatAmount | `CAST(NULL AS DECIMAL(18,2))` in the current SQL |
| CurrencyCode | `CAST(NULL AS varchar(500))` in the current SQL |
| ChangeDate | `CAST(NULL AS datetime)` in the current SQL |

## Confirmation Required

| Role | Required Decision |
|---|---|
| Data Owner | Confirm whether null placeholder fields should remain in the published supplier-invoice schema |
| SME | Confirm parsing and lookup semantics for `EngSeqNum` |
| Data Architect | Confirm whether additional target-specific metadata is required for `Invoice11` |

## Known Gaps

| Gap | Impact | Required Action | Owner |
|---|---|---|---|
| Placeholder fields are currently null | Schema can overstate functional completeness | Confirm whether to keep or remove those fields from the contract | Data Owner / SME |
| Physical target metadata is incomplete | Schema lineage stops at the logical entity | Confirm workspace and authoritative evidence source | Data Architect |