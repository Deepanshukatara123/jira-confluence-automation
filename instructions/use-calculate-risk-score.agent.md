- Use `tools/calculate-risk-score.py` when a Jira or Confluence workflow needs a consistent risk score from likelihood and impact ratings.
- Run the script from the project root with two positional arguments:
  + `python3 tools/calculate-risk-score.py <likelihood> <impact>`
  + Pass both ratings as integers from 1 through 5.
- Example: `python3 tools/calculate-risk-score.py 4 5`
- Report the labeled result, such as `Risk score: 20`.
- Preserve the source likelihood and impact values when adding the score to a Jira issue or Confluence table.
- If either rating is outside 1 through 5, report the validation error and request corrected ratings.
