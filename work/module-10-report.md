# Module 10 Completion Report

## Instruction Files
instructions/create-status-report.agent.md
instructions/creating-instructions.agent.md
instructions/generate-weekly-status-snapshot.agent.md
instructions/import-spreadsheet-data.agent.md
instructions/main.agent.md
instructions/review-risk-dependencies.agent.md

## main.agent.md Contents
# Instruction Files

- [create-status-report.agent.md](create-status-report.agent.md): Generates weekly team status reports in Markdown with fixed sections, bullet-only content, a 20-line maximum, and professional wording.
- [creating-instructions.agent.md](creating-instructions.agent.md): Creates, catalogs, and configures portable project instruction files and IDE entry points.
	+ Keywords: create instruction, update instruction, instruction catalog, agent instructions
- [import-spreadsheet-data.agent.md](import-spreadsheet-data.agent.md): Validates and previews CSV/XLSX project-data imports before loading.
	+ Keywords: CSV import, XLSX import, spreadsheet validation, data preview
- [generate-weekly-status-snapshot.agent.md](generate-weekly-status-snapshot.agent.md): Produces concise weekly project status snapshots from structured updates.
	+ Keywords: weekly status, status snapshot, project report, stakeholder update
- [review-risk-dependencies.agent.md](review-risk-dependencies.agent.md): Reviews risk and dependency records for urgent findings and actions.
	+ Keywords: risk review, dependency review, blockers, critical path, escalation

## Sample Instruction
- File: import-spreadsheet-data.agent.md
- Contents:
- Accept one CSV or XLSX file containing WBS items, milestones, resources, dependencies, risks, or action items.
- Require a declared entity type and a header row before processing.
- Validate required identifiers, owners, statuses, dates, and entity-specific fields against the project schema.
- Normalize date values to `YYYY-MM-DD` and trim whitespace without changing source meaning.
- Map source columns explicitly; report unmapped columns instead of silently discarding them.
- Detect duplicate identifiers and distinguish create, update, and conflicting records.
- Produce a preview before any write with total rows, valid rows, invalid rows, duplicates, creates, updates, and conflicts.
- Reject the batch when required fields, dates, statuses, or identifiers are invalid; do not partially load data.
- Never invent missing values; report missing data as validation errors.
- Output a Markdown validation report with sections `## Summary`, `## Errors`, `## Conflicts`, and `## Next Action`.
- Put every report item in a bullet point and include row number, field, and reason for each error.
- State whether the file is ready to import; do not claim import completion unless the user confirms the validated preview.
