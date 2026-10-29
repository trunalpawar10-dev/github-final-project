#!/bin/bash

# simple-interest.sh
# A Bash script to calculate Simple Interest
# Formula: Simple Interest (SI) = (Principal * Rate * Time) / 100
#
# Usage: ./simple-interest.sh
# The script prompts the user for:
#   - Principal amount (P)
#   - Rate of interest per year (R)
#   - Time period in years (T)
# And outputs the computed Simple Interest.

echo "==============================="
echo "  Simple Interest Calculator   "
echo "==============================="
echo ""

# Prompt user for principal amount
read -p "Enter the principal amount (P): " principal

# Prompt user for rate of interest
read -p "Enter the rate of interest (% per year) (R): " rate

# Prompt user for time period
read -p "Enter the time period (in years) (T): " time

echo ""

# Validate that inputs are not empty
if [[ -z "$principal" || -z "$rate" || -z "$time" ]]; then
  echo "Error: All fields (principal, rate, time) are required."
  exit 1
fi

# Validate that inputs are positive numbers
if ! [[ "$principal" =~ ^[0-9]+(\.[0-9]+)?$ ]] || \
   ! [[ "$rate" =~ ^[0-9]+(\.[0-9]+)?$ ]] || \
   ! [[ "$time" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
  echo "Error: Please enter valid positive numeric values."
  exit 1
fi

# Calculate Simple Interest using awk for floating-point arithmetic
simple_interest=$(awk "BEGIN {printf \"%.2f\", ($principal * $rate * $time) / 100}")

# Display the result
echo "==============================="
echo "  Principal (P)  : $principal"
echo "  Rate (R)        : $rate %"
echo "  Time (T)        : $time years"
echo "  Simple Interest : $simple_interest"
echo "==============================="
