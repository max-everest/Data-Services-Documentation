# Contact10

Summary: Contact entries for clients.

## Fields

| Name | Type | Nullable |
|------|------|----------|
| C_EntityKey | Edm.Int32 | false |
| ClientKey | Edm.Int32 | false |
| FirstName | Edm.String | true |
| LastName | Edm.String | true |
| Ranking | Edm.Int64 | true |
| Salutation | Edm.String | true |
| Title | Edm.String | true |
| ValidFrom | Edm.DateTimeOffset | true |

## API Usage


### Filter example
`GET /api/clientengine/Contact10?$filter=ClientKey eq 123` 

## Responses

- **200 OK** — Green: Request succeeded, data returned. See the API guide: [API guide](../api.md).
- **4xx Client Errors** — Red: 400/401/403/404 indicate client or auth problems.
- **Other** — Yellow: 201/204/500 and similar non-200 responses.
