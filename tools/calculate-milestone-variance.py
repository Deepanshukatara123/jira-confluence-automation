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
