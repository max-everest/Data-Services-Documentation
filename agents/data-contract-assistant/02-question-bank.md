This gives the agent a structured discovery process. It should ask targeted questions and then map answers into YAML.

```markdown
# Data Contract Question Bank

The assistant should use these questions during discovery.

Do not ask all questions at once. Ask by section.

## Section 1 — Identity

1. What is the name of the data product?
2. What domain does it belong to?
3. What layer is it in? Bronze, Silver, Gold, Semantic, API, Report?
4. Is this a new contract or an update to an existing contract?
5. What is the current status? Draft, in review, active, deprecated?

## Section 2 — Purpose and Business Context

1. What business problem does this data product solve?
2. Who uses the data?
3. What decisions or processes depend on it?
4. What would go wrong if the data was late, missing, duplicated, or incorrect?
5. What is explicitly out of scope?

## Section 3 — Ownership

1. Who is the business owner?
2. Who is the data owner?
3. Who is the source SME?
4. Who is the technical owner?
5. Who supports this in production?
6. Who approves changes?

## Section 4 — Source Systems

1. Which system or systems provide the source data?
2. What datasets, tables, views, files, or API endpoints are used?
3. Who owns the source?
4. How often is the source refreshed?
5. Are there source access restrictions?
6. Are there known source quality issues?
7. Are there expected source schema changes?

## Section 5 — Target and Consumers

1. Where is the data written?
2. What platform hosts it?
3. What table, path, schema, or API is exposed?
4. Who consumes it?
5. Is it used in Power BI, downstream pipelines, APIs, exports, or operational processes?
6. Are there access restrictions?

## Section 6 — Schema

For each output field:

1. What is the field name?
2. What does it mean in business language?
3. What is the logical type?
4. What is the physical type?
5. Is it mandatory?
6. Is it a critical data element?
7. What is the source field or derivation?
8. Are there allowed values?
9. Can nulls occur?
10. What is an example value?

## Section 7 — Business Rules

1. What records are included?
2. What records are excluded?
3. What filters are applied?
4. What joins/lookups are required?
5. What fields are derived?
6. What assumptions are made?
7. What edge cases exist?
8. What known limitations should users understand?

## Section 8 — Quality Rules

1. Which fields must never be null?
2. Which fields must be unique?
3. Which fields must be within a valid range?
4. Which totals should reconcile?
5. Which fields should match reference data?
6. Which rules should fail the pipeline?
7. Which rules should warn but allow processing?
8. Where is quality evidence written?

## Section 9 — SLAs

1. How often should the data refresh?
2. How quickly should it be available after the source is ready?
3. What is the expected duration of the process?
4. What is the cutoff threshold?
5. What retention period applies?
6. What availability target applies?
7. What support response is expected?

## Section 10 — Monitoring and Alerting

1. What signals should be monitored?
2. What thresholds define a failure?
3. Which failures are P1, P2, P3, P4, or P5?
4. Who is alerted?
5. Which channel is used?
6. Is auto-remediation possible?
7. Where is the monitoring dashboard?
8. Where is audit/error evidence stored?

## Section 11 — Runbook

1. When should the runbook be used?
2. What are the most common failure symptoms?
3. What is the first diagnostic step?
4. What SQL or commands should support use?
5. What upstream jobs should be checked?
6. What downstream systems may be impacted?
7. Who should be escalated to?
8. What communication templates are needed?

## Section 12 — Change Management

1. What is a defect for this data product?
2. What is an operational change?
3. What is an enhancement?
4. What changes require data owner approval?
5. What changes require architecture approval?
6. What changes require support notification?
7. What is the review cadence?