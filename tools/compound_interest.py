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
