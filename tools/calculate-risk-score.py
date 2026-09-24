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
