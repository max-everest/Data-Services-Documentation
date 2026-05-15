# SystemKeys10

Summary: External system keys and identifiers for clients.

## Fields

| Name | Type | Nullable |
|------|------|----------|
| C_EntityKey | Edm.Int32 | false |
| ClientKey | Edm.Int32 | false |
| ClientCode | Edm.String | true |
| PasoKey | Edm.Int32 | true |
| DynamicsKey | Edm.String | true |
| CompanyHouseKey | Edm.String | true |
| RetainKey | Edm.Int32 | true |

## API Usage

- GET /api/clientengine/SystemKeys10

### Filter example
`GET /api/clientengine/SystemKeys10?$filter=ClientKey eq 123`

## Responses

- <span style="background-color:#d1fae5;color:#065f46;padding:4px 8px;border-radius:6px;font-weight:600">200 OK</span> — Request succeeded, data returned. See the API guide: [API guide](../api.md).
- <span style="background-color:#fee2e2;color:#991b1b;padding:4px 8px;border-radius:6px;font-weight:600">4xx Client Errors</span> — 400/401/403/404 indicate client or auth problems.
- <span style="background-color:#fef3c7;color:#92400e;padding:4px 8px;border-radius:6px;font-weight:600">Other</span> — 201/204/500 and similar non-200 responses.
