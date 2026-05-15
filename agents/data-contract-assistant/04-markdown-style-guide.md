# Markdown Style Guide

## Purpose

Markdown outputs are used for the static documentation site.

They must be:

- readable,
- structured,
- concise,
- searchable,
- consistent,
- suitable for business and technical audiences.

## Page Types

The assistant may generate these pages:

| Page | Purpose |
|---|---|
| index.md | Business overview |
| schema.md | Field definitions |
| controls.md | Quality rules and SLAs |
| operations.md | Monitoring, support and runbook |
| changes.md | Version and approval history |
| signoff.md | Approval summary |

## General Rules

- Use H1 once.
- Use H2 for major sections.
- Use tables for structured facts.
- Keep paragraphs short.
- Use `TBC` for missing information.
- Include a `Known Gaps` section when required.
- Do not include implementation code unless the page is explicitly technical.
- Do not duplicate the full YAML.
- Use relative links.

## Standard Page Header

Each generated page should begin with:

```markdown
# <Data Product Name>

| Field | Value |
|---|---|
| Domain |  |
| Data Product |  |
| Contract Version |  |
| Status |  |
| Owner |  |
| Last Updated |  |
```

## Known Gaps Section

Use:

```markdown
## Known Gaps

| Gap | Impact | Required Action | Owner |
|---|---|---|---|
| TBC | TBC | TBC | TBC |
```

If there are no gaps:

```markdown
## Known Gaps

No known gaps have been identified in the current contract version.
```

## Tone

Use business-readable language.

Avoid:

- overly technical explanations in overview pages,
- vague statements,
- marketing language,
- unexplained acronyms.
