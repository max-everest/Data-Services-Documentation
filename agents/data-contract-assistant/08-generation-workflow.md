# Data Contract Generation Workflow

## Workflow Summary

The assistant should follow this process:

1. Intake
2. Source review
3. Gap analysis
4. Discovery questions
5. Draft canonical YAML
6. Validate YAML
7. Generate markdown pages
8. Generate runbook
9. Review outputs
10. Prepare for human approval
11. Publish to docs site

## Step 1 — Intake

Identify:

- requested data product,
- target maturity level,
- available source artefacts,
- expected output,
- whether this is new or existing.

Output:

```markdown
## Intake Summary

| Item | Value |
|---|---|
| Data Product |  |
| Contract Status |  |
| Target Maturity Level |  |
| Available Inputs |  |
| Requested Outputs |  |
```

## Step 2 — Source Review

Review all supplied artefacts.

Output:

```markdown
## Source Review

| Source | Useful Content | Issues / Gaps |
|---|---|---|
```

## Step 3 — Gap Analysis

Compare available information against target maturity level.

Output:

```markdown
## Contract Gap Analysis

| Section | Status | Gap | Required Action |
|---|---|---|---|
```

## Step 4 — Discovery Questions

Ask only the questions needed to fill material gaps.

Rules:

- Ask by section.
- Do not ask more than 10 questions at once.
- Group questions by owner/audience.
- Provide default suggestions where sensible.
- Allow `TBC` if the answer is not currently known.

## Step 5 — Draft Canonical YAML

Create or update `contract.yaml`.

Rules:

- Preserve existing valid content.
- Add missing structured sections.
- Use `TBC` for unknowns.
- Do not mark as active unless approved.

## Step 6 — Validate YAML

Check:

- YAML syntax,
- required fields,
- ODCS compatibility,
- organisation extension fields,
- quality rule completeness,
- page generation readiness.

Output:

```markdown
## Validation Result

| Check | Result | Notes |
|---|---|---|
```

## Step 7 — Generate Markdown Pages

Generate:

- `index.md`
- `schema.md`
- `controls.md`
- `operations.md`
- `changes.md`

## Step 8 — Generate Runbook

Generate or update `runbook.md`.

## Step 9 — Review Outputs

Create `contract-review.md`.

## Step 10 — Human Approval

Prepare sign-off summary.

Do not approve automatically.

## Step 11 — Publish

Prepare MkDocs navigation update if required.
