# Module 12 Completion Report

## Instruction File
- Filename: instructions/calculate-compound-interest.agent.md

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

- Filename: instructions/use-calculate-risk-score.agent.md

- Use `tools/calculate-risk-score.py` when a Jira or Confluence workflow needs a consistent risk score from likelihood and impact ratings.
- Run the script from the project root with two positional arguments:
  + `python3 tools/calculate-risk-score.py <likelihood> <impact>`
  + Pass both ratings as integers from 1 through 5.
- Example: `python3 tools/calculate-risk-score.py 4 5`
- Report the labeled result, such as `Risk score: 20`.
- Preserve the source likelihood and impact values when adding the score to a Jira issue or Confluence table.
- If either rating is outside 1 through 5, report the validation error and request corrected ratings.

- Filename: instructions/use-calculate-milestone-variance.agent.md

- Use `tools/calculate-milestone-variance.py` when a Jira or Confluence workflow needs variance between a milestone baseline and its actual or forecast date.
- Run the script from the project root with two positional arguments:
  + `python3 tools/calculate-milestone-variance.py <baseline_date> <comparison_date>`
  + Pass both dates in ISO format: `YYYY-MM-DD`.
- Example: `python3 tools/calculate-milestone-variance.py 2026-09-30 2026-10-05`
- Report the labeled result, including the signed day count and status: `Variance: +5 days (delayed)`.
- Treat a positive value as delayed, a negative value as ahead of baseline, and zero as on baseline.
- If a date is invalid or not in ISO format, report the validation error and request corrected dates.

## Script File
- Filename: tools/compound_interest.py
- Language: Python

"""Calculate compound interest from command-line inputs."""

import argparse


def calculate_compound_interest(
    principal: float,
    annual_rate: float,
    compounds_per_year: int,
    total_years: float,
) -> tuple[float, float]:
    """Return the final amount and interest earned."""
    if principal < 0:
        raise ValueError("principal must be non-negative")
    if annual_rate < 0:
        raise ValueError("annual rate must be non-negative")
    if compounds_per_year <= 0:
        raise ValueError("compounds per year must be positive")
    if total_years < 0:
        raise ValueError("total years must be non-negative")

    periodic_rate = annual_rate / 100 / compounds_per_year
    periods = compounds_per_year * total_years
    final_amount = principal * (1 + periodic_rate) ** periods
    return final_amount, final_amount - principal


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Calculate compound interest."
    )
    parser.add_argument("principal", type=float, help="initial principal")
    parser.add_argument(
        "annual_rate", type=float, help="annual interest rate as a percentage"
    )
    parser.add_argument(
        "compounds_per_year", type=int, help="number of compounding periods per year"
    )
    parser.add_argument("total_years", type=float, help="total investment time in years")
    arguments = parser.parse_args()

    try:
        final_amount, interest_earned = calculate_compound_interest(
            arguments.principal,
            arguments.annual_rate,
            arguments.compounds_per_year,
            arguments.total_years,
        )
    except ValueError as error:
        parser.error(str(error))

    print(f"Final amount: ${final_amount:,.2f}")
    print(f"Interest earned: ${interest_earned:,.2f}")


if __name__ == "__main__":
    main()

- Filename: tools/calculate-risk-score.py
- Language: Python

"""Calculate a risk score from likelihood and impact ratings."""

import argparse


def calculate_risk_score(likelihood: int, impact: int) -> int:
    """Return the risk score as likelihood multiplied by impact."""
    if not 1 <= likelihood <= 5:
        raise ValueError("likelihood must be an integer from 1 through 5")
    if not 1 <= impact <= 5:
        raise ValueError("impact must be an integer from 1 through 5")
    return likelihood * impact


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Calculate a risk score from 1-to-5 likelihood and impact ratings."
    )
    parser.add_argument("likelihood", type=int, help="likelihood rating from 1 through 5")
    parser.add_argument("impact", type=int, help="impact rating from 1 through 5")
    arguments = parser.parse_args()

    try:
        score = calculate_risk_score(arguments.likelihood, arguments.impact)
    except ValueError as error:
        parser.error(str(error))

    print(f"Risk score: {score}")


if __name__ == "__main__":
    main()

- Filename: tools/calculate-milestone-variance.py
- Language: Python

"""Calculate milestone variance against a baseline date."""

import argparse
from datetime import date


def calculate_milestone_variance(baseline_date: str, comparison_date: str) -> int:
    """Return comparison date variance from baseline in calendar days."""
    try:
        baseline = date.fromisoformat(baseline_date)
        comparison = date.fromisoformat(comparison_date)
    except ValueError as error:
        raise ValueError("dates must use ISO format YYYY-MM-DD") from error

    return (comparison - baseline).days


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Calculate milestone variance from a baseline date."
    )
    parser.add_argument("baseline_date", help="baseline date in YYYY-MM-DD format")
    parser.add_argument(
        "comparison_date",
        help="actual or forecast date in YYYY-MM-DD format",
    )
    arguments = parser.parse_args()

    try:
        variance_days = calculate_milestone_variance(
            arguments.baseline_date,
            arguments.comparison_date,
        )
    except ValueError as error:
        parser.error(str(error))

    if variance_days > 0:
        status = "delayed"
    elif variance_days < 0:
        status = "ahead"
    else:
        status = "on baseline"

    print(f"Variance: {variance_days:+d} days ({status})")


if __name__ == "__main__":
    main()

## Script Execution Output

### tools/compound_interest.py --help
~~~text
usage: compound_interest.py [-h]
                            principal annual_rate compounds_per_year
                            total_years

Calculate compound interest.

positional arguments:
  principal           initial principal
  annual_rate         annual interest rate as a percentage
  compounds_per_year  number of compounding periods per year
  total_years         total investment time in years

optional arguments:
  -h, --help          show this help message and exit
~~~

### tools/calculate-risk-score.py --help
~~~text
usage: calculate-risk-score.py [-h] likelihood impact

Calculate a risk score from 1-to-5 likelihood and impact ratings.

positional arguments:
  likelihood  likelihood rating from 1 through 5
  impact      impact rating from 1 through 5

optional arguments:
  -h, --help  show this help message and exit
~~~

### tools/calculate-milestone-variance.py --help
~~~text
usage: calculate-milestone-variance.py [-h] baseline_date comparison_date

Calculate milestone variance from a baseline date.

positional arguments:
  baseline_date    baseline date in YYYY-MM-DD format
  comparison_date  actual or forecast date in YYYY-MM-DD format

optional arguments:
  -h, --help  show this help message and exit
~~~
