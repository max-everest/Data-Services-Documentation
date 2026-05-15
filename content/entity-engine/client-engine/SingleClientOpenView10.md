# SingleClientOpenView10

Summary: Lightweight single-client view for open records.

## Fields

| Name | Type | Nullable |
|------|------|----------|
| C_EntityKey | Edm.Int32 | false |
| ChangeDate | Edm.DateTimeOffset | true |
| ClientCode | Edm.String | true |
| ClientKey | Edm.Int32 | false |
| ClientName | Edm.String | true |
| ClientStatus | Edm.String | true |
| CSEName | Edm.String | true |
| CSEPasoKey | Edm.Int32 | true |
| CSEPayrollKey | Edm.String | true |
| CSEUserName | Edm.String | true |
| DynamicsKey | Edm.String | true |
| IsActive | Edm.Int32 | true |
| IsCSEActive | Edm.Int32 | true |
| PasoKey | Edm.Int32 | true |

## API Usage

- GET /api/clientengine/SingleClientOpenView10

### Filter
`GET /api/clientengine/SingleClientOpenView10?$filter=ClientKey eq 123`

## Responses

- <span style="background-color:#d1fae5;color:#065f46;padding:4px 8px;border-radius:6px;font-weight:600">200 OK</span> — Request succeeded, data returned. See the API guide: [API guide](../api.md).
- <span style="background-color:#fee2e2;color:#991b1b;padding:4px 8px;border-radius:6px;font-weight:600">4xx Client Errors</span> — Red: 400/401/403/404 indicate client or auth problems.
- <span style="background-color:#fef3c7;color:#92400e;padding:4px 8px;border-radius:6px;font-weight:600">Other</span> — Yellow: 201/204/500 and similar non-200 responses.
