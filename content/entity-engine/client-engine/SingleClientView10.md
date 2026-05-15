# SingleClientView10

Summary: Detailed single-client view with billing and contact details.

## Fields

| Name | Type | Nullable |
|------|------|----------|
| C_EntityKey | Edm.Int32 | false |
| BillingClosingBalance | Edm.Decimal | true |
| BillingEmail | Edm.String | true |
| BusinessType | Edm.String | true |
| ChangeDate | Edm.DateTimeOffset | true |
| ClientBDStatus | Edm.String | true |
| ClientCode | Edm.String | true |
| ClientEnd | Edm.DateTimeOffset | true |
| ClientKey | Edm.Int32 | false |
| ClientName | Edm.String | true |
| ClientStart | Edm.DateTimeOffset | true |
| ClientStatus | Edm.String | true |
| CommercialFinanceEmploymentKey | Edm.Int32 | true |
| CompanyHouseKey | Edm.String | true |
| Country | Edm.String | true |
| County | Edm.String | true |
| CreditControlEmail | Edm.String | true |
| CreditScore | Edm.Int32 | true |
| CSEEmploymentKey | Edm.Int32 | true |
| CSEName | Edm.String | true |
| CSEOffice | Edm.String | true |
| CSEPasoKey | Edm.Int32 | true |
| CSEPayrollKey | Edm.String | true |
| CSERegion | Edm.String | true |
| CSEUserName | Edm.String | true |
| DynamicsKey | Edm.String | true |
| Employees | Edm.Int32 | true |
| EngagementCount | Edm.Int32 | true |
| FirmCount | Edm.Int32 | true |
| FirstName | Edm.String | true |
| GDPRChangeDate | Edm.DateTimeOffset | true |
| GDPRContactEmail | Edm.String | true |
| GDPROptIn | Edm.Int32 | true |
| HasOpenEngagement | Edm.Boolean | true |
| HasTestimonial | Edm.Boolean | true |
| ImmediateParentPasoKey | Edm.Int32 | true |
| IndustryFocus | Edm.String | true |
| IsActive | Edm.Int32 | true |
| IsCompetitor | Edm.Boolean | true |
| IsCSEActive | Edm.Int32 | true |
| IsIntermediary | Edm.Boolean | true |
| IsInternational | Edm.Int32 | true |
| IsOrganisation | Edm.Int32 | true |
| IsSupplier | Edm.Boolean | true |
| IsTarget | Edm.Boolean | true |
| KM1 | Edm.Int32 | false |
| KM2 | Edm.Int32 | false |
| KMCount | Edm.Int32 | true |
| LastEngagementChange | Edm.DateTimeOffset | true |
| LastName | Edm.String | true |
| Line1 | Edm.String | true |
| Line2 | Edm.String | true |
| Line3 | Edm.String | true |
| Line4 | Edm.String | true |
| MailingName | Edm.String | true |
| NetAssets | Edm.Decimal | true |
| OpenDeals | Edm.Int32 | true |
| OperatingProfit | Edm.Decimal | true |
| OrganisationType | Edm.String | true |
| PasoKey | Edm.Int32 | true |
| PostalCode | Edm.String | true |
| PreTaxProfit | Edm.Decimal | true |
| PrimaryEmailAddress | Edm.String | true |
| RelationshipLeaderEmploymentKey | Edm.Int32 | true |
| RetainKey | Edm.Int32 | true |
| RiskIndicator | Edm.String | true |
| Rolling12MonthBilled | Edm.Decimal | true |
| Salutation | Edm.String | true |
| Sector | Edm.String | true |
| Segment | Edm.String | true |
| SicCode | Edm.String | true |
| SicDescription | Edm.String | true |
| SicSectionDescription | Edm.String | true |
| SubSector | Edm.String | true |
| TargetType | Edm.String | true |
| Title | Edm.String | true |
| TrackerLink | Edm.String | true |
| TrackerStatus | Edm.String | true |
| Turnover | Edm.Decimal | true |
| UltimateParentPasoKey | Edm.Int32 | true |
| VocInterviewCount | Edm.Int32 | false |
| Website | Edm.String | true |
| PreviousPayrollKey | Edm.String | true |

## API Usage

- GET /api/clientengine/SingleClientView10

### Filter example
`GET /api/clientengine/SingleClientView10?$filter=ClientKey eq 123`

## Responses

- <span style="background-color:#d1fae5;color:#065f46;padding:4px 8px;border-radius:6px;font-weight:600">200 OK</span> — Request succeeded, data returned. See the API guide: [API guide](../api.md).
- <span style="background-color:#fee2e2;color:#991b1b;padding:4px 8px;border-radius:6px;font-weight:600">4xx Client Errors</span> — Red: 400/401/403/404 indicate client or auth problems.
- <span style="background-color:#fef3c7;color:#92400e;padding:4px 8px;border-radius:6px;font-weight:600">Other</span> — Yellow: 201/204/500 and similar non-200 responses.
