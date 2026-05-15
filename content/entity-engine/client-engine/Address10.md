# Address10

Summary: Address records associated with clients.

## Fields

| Name | Type | Nullable |
|------|------|----------|
| C_EntityKey | Edm.Int32 | false |
| Active | Edm.Int32 | false |
| AddressType | Edm.String | true |
| AddressTypeKey | Edm.Int32 | true |
| ClientKey | Edm.Int32 | false |
| Country | Edm.String | true |
| County | Edm.String | true |
| Latitude | Edm.Decimal | true |
| Line1 | Edm.String | true |
| Line2 | Edm.String | true |
| Line3 | Edm.String | true |
| Line4 | Edm.String | true |
| Longitude | Edm.Decimal | true |
| PostalCode | Edm.String | true |
| ValidFrom | Edm.DateTimeOffset | true |
| ValidTo | Edm.DateTimeOffset | true |
| PrimarySw | Edm.Int32 | false |
| AddressOrder | Edm.Int64 | true |

## API Usage


### Filter example
`GET /api/clientengine/Address10?$filter=ClientKey eq 123 and PrimarySw eq 1`

## Responses

- <span style="background-color:#d1fae5;color:#065f46;padding:4px 8px;border-radius:6px;font-weight:600">200 OK</span> — Request succeeded, data returned. See the API guide: [API guide](../api.md).
- <span style="background-color:#fee2e2;color:#991b1b;padding:4px 8px;border-radius:6px;font-weight:600">4xx Client Errors</span> — 400/401/403/404 indicate client or auth problems.
- <span style="background-color:#fef3c7;color:#92400e;padding:4px 8px;border-radius:6px;font-weight:600">Other</span> — 201/204/500 and similar non-200 responses.
