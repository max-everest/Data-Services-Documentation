# SingleClientView11

Summary: Updated single-client view (version 11) with extended fields.

## Fields

| Name | Type | Nullable |
|------|------|----------|
| C_EntityKey | Edm.Int32 | false |
| ClientKey | Edm.Int32 | false |
| ClientName | Edm.String | true |
| ClientStatus | Edm.String | true |
| ClientCode | Edm.String | true |
| CSEName | Edm.String | true |
| CSEPasoKey | Edm.Int32 | true |
| CSEPayrollKey | Edm.String | true |
| CSEUserName | Edm.String | true |
| IsActive | Edm.Int32 | true |
| IsCSEActive | Edm.Int32 | true |
| PasoKey | Edm.Int32 | true |
| DynamicsKey | Edm.String | true |
| ClientStart | Edm.DateTimeOffset | true |
| ClientEnd | Edm.DateTimeOffset | true |
| CompanyHouseKey | Edm.String | true |
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
| CSEOffice | Edm.String | true |
| CSERegion | Edm.String | true |
| CSEEmploymentKey | Edm.Int32 | true |
| SicSectionDescription | Edm.String | true |
| SicDescription | Edm.String | true |
| Rolling12MonthBilled | Edm.Decimal | true |
| BillingClosingBalance | Edm.Decimal | true |
| ClientBDStatus | Edm.String | true |
| IsInternational | Edm.Int32 | true |
| IsOrganisation | Edm.Int32 | true |
| TargetType | Edm.String | true |
| KMCount | Edm.Int32 | true |
| IsIntermediary | Edm.Boolean | true |
| IsCompetitor | Edm.Boolean | true |
| IsSupplier | Edm.Boolean | true |
| Website | Edm.String | true |
| OpenDeals | Edm.Int32 | true |
| GDPRContactEmail | Edm.String | true |
| GDPROptIn | Edm.Int32 | true |
| GDPRChangeDate | Edm.DateTimeOffset | true |
| Title | Edm.String | true |
| FirstName | Edm.String | true |
| LastName | Edm.String | true |
| Salutation | Edm.String | true |
| Line1 | Edm.String | true |
| Line2 | Edm.String | true |
| Line3 | Edm.String | true |
| Line4 | Edm.String | true |
| County | Edm.String | true |
| Country | Edm.String | true |
| PostalCode | Edm.String | true |
| ImmediateParentPasoKey | Edm.Int32 | true |
| UltimateParentPasoKey | Edm.Int32 | true |
| IndustryFocus | Edm.String | true |
| OrganisationType | Edm.String | true |
| EngagementCount | Edm.Int32 | true |
| HasOpenEngagement | Edm.Boolean | true |
| Segment | Edm.String | true |
| KM1 | Edm.Int32 | true |
| KM2 | Edm.Int32 | true |
| FirmCount | Edm.Int32 | true |
| HasTestimonial | Edm.Boolean | true |
| IsTarget | Edm.Boolean | true |
| VocInterviewCount | Edm.Int32 | true |
| MailingName | Edm.String | true |
| CreditControlEmail | Edm.String | true |
| BillingEmail | Edm.String | true |
| Sector | Edm.String | true |
| SubSector | Edm.String | true |
| BusinessType | Edm.String | true |
| CommercialFinanceEmploymentKey | Edm.Int32 | true |
| RetainKey | Edm.Int32 | true |
| PrimaryEmailAddress | Edm.String | true |
| RelationshipLeaderEmploymentKey | Edm.Int32 | true |
| LastEngagementChange | Edm.DateTimeOffset | true |
| IsProspective | Edm.Boolean | true |
| IsManuallyCreated | Edm.Boolean | true |
| ChangeDate | Edm.DateTimeOffset | true |

## API Usage

- GET /api/clientengine/SingleClientView11

### Filter example
`GET /api/clientengine/SingleClientView11?$filter=ClientKey eq 123`

## Responses

- <span style="background-color:#d1fae5;color:#065f46;padding:4px 8px;border-radius:6px;font-weight:600">200 OK</span> — Request succeeded, data returned. See the API guide: [API guide](../api.md).
- <span style="background-color:#fee2e2;color:#991b1b;padding:4px 8px;border-radius:6px;font-weight:600">4xx Client Errors</span> — Red: 400/401/403/404 indicate client or auth problems.
- <span style="background-color:#fef3c7;color:#92400e;padding:4px 8px;border-radius:6px;font-weight:600">Other</span> — Yellow: 201/204/500 and similar non-200 responses.
