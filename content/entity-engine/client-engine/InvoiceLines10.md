# InvoiceLines10

Summary: Invoice line items and tax/cost details.

## Fields

| Name | Type | Nullable |
|------|------|----------|
| C_EntityKey | Edm.Int32 | false |
| EngagementKey | Edm.Int32 | true |
| ClientKey | Edm.Int32 | true |
| PhaseKey | Edm.Int32 | true |
| InvoiceHeaderKey | Edm.Int32 | false |
| TaxRate | Edm.Decimal | true |
| CostCenter | Edm.String | true |
| IsTime | Edm.Int32 | true |
| IsDisbursement | Edm.Int32 | true |
| InvoiceLineGrossValue | Edm.Decimal | true |
| InvoiceLineTaxValue | Edm.Decimal | true |
| VisibleOnInvoice | Edm.Int32 | false |
| InvoiceEntryType | Edm.String | true |
| InvoiceEntryDescription | Edm.String | true |
| ChangeDate | Edm.DateTimeOffset | true |
| DisbursementGroup | Edm.String | true |
| DisbursementType | Edm.String | true |
| TaxDate | Edm.DateTimeOffset | true |
| InvoiceLineOrder | Edm.Int32 | true |
| PasoDisbursementGroupKey | Edm.Int32 | true |
| PasoDisbursementTypeKey | Edm.Int32 | true |
| PasoTaxRateKey | Edm.Int32 | true |

## API Usage

- GET /api/clientengine/InvoiceLines10

### Filter example
`GET /api/clientengine/InvoiceLines10?$filter=InvoiceHeaderKey eq 987`

## Responses

- <span style="background-color:#d1fae5;color:#065f46;padding:4px 8px;border-radius:6px;font-weight:600">200 OK</span> — Request succeeded, data returned. See the API guide: [docs/entity-engine/api.md](docs/entity-engine/api.md).
- <span style="background-color:#fee2e2;color:#991b1b;padding:4px 8px;border-radius:6px;font-weight:600">4xx Client Errors</span> — 400/401/403/404 indicate client or auth problems.
- <span style="background-color:#fef3c7;color:#92400e;padding:4px 8px;border-radius:6px;font-weight:600">Other</span> — 201/204/500 and similar non-200 responses.
