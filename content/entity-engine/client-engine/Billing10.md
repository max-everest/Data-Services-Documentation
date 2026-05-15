# Billing10

Summary: Billing and financial summary metrics per client.

## Fields

| Name | Type | Nullable |
|------|------|----------|
| C_EntityKey | Edm.Int32 | false |
| ChangeDate | Edm.DateTimeOffset | true |
| ClientKey | Edm.Int32 | false |
| ClosingBalance | Edm.Decimal | true |
| ContactID | Edm.String | true |
| Name | Edm.String | true |
| Period | Edm.String | true |
| RecurringBilling | Edm.Decimal | true |
| Rolling12Month | Edm.Decimal | true |
| Wonf | Edm.Decimal | true |
| Time | Edm.Decimal | true |
| Costs | Edm.Decimal | true |

## API Usage


### Filter example
`GET /api/clientengine/Billing10?$filter=ClientKey eq 123`

## Responses

- <span style="background-color:#d1fae5;color:#065f46;padding:4px 8px;border-radius:6px;font-weight:600">200 OK</span> — Request succeeded, data returned. See the API guide: [API guide](../api.md).
- <span style="background-color:#fee2e2;color:#991b1b;padding:4px 8px;border-radius:6px;font-weight:600">4xx Client Errors</span> — Red: 400/401/403/404 indicate client or auth problems.
- <span style="background-color:#fef3c7;color:#92400e;padding:4px 8px;border-radius:6px;font-weight:600">Other</span> — Yellow: 201/204/500 and similar non-200 responses.
