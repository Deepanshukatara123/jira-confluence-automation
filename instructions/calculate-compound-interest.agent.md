- Use `tools/compound_interest.py` when a user needs a compound-interest calculation from a principal, annual rate, compounding frequency, and duration.
- Run the script from the project root with four positional arguments:
  + `python tools/compound_interest.py <principal> <annual_rate> <compounds_per_year> <total_years>`
  + Pass `annual_rate` as a percentage, such as `7.34` for 7.34%.
  + Pass `total_years` as a number of years; decimals are supported.
- Example: `python tools/compound_interest.py 15847 7.34 12 8.5833333333`
- Present both output values exactly as labeled by the script:
  + `Final amount: $...`
  + `Interest earned: $...`
- Format results to two decimal places and retain the dollar sign and thousands separators.
- Explain the inputs briefly when reporting results, especially when the duration is expressed in months or another unit that was converted to years.
- If an argument is invalid, report the validation error and ask for corrected non-negative principal, non-negative annual rate, positive compounding frequency, and non-negative duration.
