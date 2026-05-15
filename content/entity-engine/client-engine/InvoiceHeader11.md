# InvoiceHeader11

Summary: Version 11 invoice header, similar to InvoiceHeader10 with change tracking.

## Fields

| Name | Type | Nullable |
|------|------|----------|
| C_EntityKey | Edm.Int32 | false |
| InvoiceHeaderKey | Edm.Int32 | false |
| ClientKey | Edm.Int32 | true |
| PasoInvoiceKey | Edm.String | true |
| ContactKey | Edm.Int32 | true |
| AddressKey | Edm.Int32 | true |
| InvoiceNetAmount | Edm.Decimal | true |
| InvoiceTaxAmount | Edm.Decimal | true |
| IsAdjustment | Edm.Boolean | true |
| BillingDate | Edm.DateTimeOffset | false |
| PasoInvoiceHeaderKey | Edm.Int32 | false |
| Company | Edm.String | true |
| Settled | Edm.Int32 | false |
| PostedDate | Edm.DateTimeOffset | false |
| OutstandingValue | Edm.Decimal | true |
| AdjustedPasoInvoiceKey | Edm.String | true |
| PasoTaxInvoiceKey | Edm.Int32 | false |
| ChangeDate | Edm.DateTimeOffset | true |

## API Usage

- GET /api/clientengine/InvoiceHeader11

### Filter example
`GET /api/clientengine/InvoiceHeader11?$filter=InvoiceHeaderKey eq 100`

## Responses

- <span style="background-color:#d1fae5;color:#065f46;padding:4px 8px;border-radius:6px;font-weight:600">200 OK</span> — Request succeeded, data returned. See the API guide: [API guide](../api.md).
- <span style="background-color:#fee2e2;color:#991b1b;padding:4px 8px;border-radius:6px;font-weight:600">4xx Client Errors</span> — 400/401/403/404 indicate client or auth problems.
- <span style="background-color:#fef3c7;color:#92400e;padding:4px 8px;border-radius:6px;font-weight:600">Other</span> — 201/204/500 and similar non-200 responses.
