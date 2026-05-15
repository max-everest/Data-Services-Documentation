# Tracker10

Summary: Financial/credit tracker details for a client.

## Fields

| Name | Type | Nullable |
|------|------|----------|
| C_EntityKey | Edm.Int32 | false |
| ClientKey | Edm.Int32 | false |
| TrackerStatus | Edm.String | true |
| SicCode | Edm.String | true |
| TrackerLink | Edm.String | true |
| CreditScore | Edm.Int32 | true |
| RiskIndicator | Edm.String | true |
| Turnover | Edm.Decimal | true |
| NetAssets | Edm.Decimal | true |
| Employees | Edm.Int32 | true |
| OperatingProfit | Edm.Decimal | true |
| PreTaxProfit | Edm.Decimal | true |
| AuditFee | Edm.Decimal | true |
| NonAuditFee | Edm.Decimal | true |
| CurrentAuditor | Edm.String | true |
| NearestOffice | Edm.String | true |
| Sector | Edm.String | true |
| SubSector | Edm.String | true |

## API Usage

- GET /api/clientengine/Tracker10

### Filter example
`GET /api/clientengine/Tracker10?$filter=CreditScore lt 300`

## Responses

- <span style="background-color:#d1fae5;color:#065f46;padding:4px 8px;border-radius:6px;font-weight:600">200 OK</span> — Request succeeded, data returned. See the API guide: [API guide](../api.md).
- <span style="background-color:#fee2e2;color:#991b1b;padding:4px 8px;border-radius:6px;font-weight:600">4xx Client Errors</span> — Red: 400/401/403/404 indicate client or auth problems.
- <span style="background-color:#fef3c7;color:#92400e;padding:4px 8px;border-radius:6px;font-weight:600">Other</span> — Yellow: 201/204/500 and similar non-200 responses.
