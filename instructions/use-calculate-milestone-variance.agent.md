- Use `tools/calculate-milestone-variance.py` when a Jira or Confluence workflow needs variance between a milestone baseline and its actual or forecast date.
- Run the script from the project root with two positional arguments:
  + `python3 tools/calculate-milestone-variance.py <baseline_date> <comparison_date>`
  + Pass both dates in ISO format: `YYYY-MM-DD`.
- Example: `python3 tools/calculate-milestone-variance.py 2026-09-30 2026-10-05`
- Report the labeled result, including the signed day count and status: `Variance: +5 days (delayed)`.
- Treat a positive value as delayed, a negative value as ahead of baseline, and zero as on baseline.
- If a date is invalid or not in ISO format, report the validation error and request corrected dates.
