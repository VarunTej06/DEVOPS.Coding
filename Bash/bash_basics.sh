#!/bin/bash

set -x # Runs script in debug mode

set -e # exists scripts when there is an error
trap 'echo "Error occured at line $LINENO"' ERR  # catches the error and prints the ;ine number where error occured

set -o pipefail # checks for piep errors that are missed in above command

: '
Considering each sample as a separate bash script file, CLI command to be used is given at the end of sample example.
If this entire file is executed then we need to pass two arguments along with execution command for sample 2 
and for rest of the examples it will ask to enter.'

# Sample -1: Reading multiple inputs from CLI and assigning to arrays

read -p "Enter customer details: " -a details
# -a treats input from CLI as an array and stores in details variable

echo "Customer name: ${details[0]}"
echo "Customer age: ${details[1]}"

# CLI Command: ./filename then it will ask you to enter arguments

# Sample -2: Reading multiple inputs from CLI and assigning to arrays

# Declare an array to store arguments
cust_details=("$@")

# Uncomment this if you want to assign values in revers order 0 will take age and 1 will take name
# for cust_details in "$@"; do
# cust_details+=("$cust_details")
# done

echo "Customer name: ${cust_details[0]}"
echo "Customer age: ${cust_details[1]}"

# CLI Command: ./file_name varun 24

# Sample -3: Reading multiple inputs from CLI and assigning to Variables
read -p "Enter customer details: " cust_name cust_age
# -a treats input from CLI as an array and stores in details variable

echo "Customer name: $cust_name"
echo "Customer age: $cust_age"

# CLI Command: ./filename then it will ask you to enter arguments

set +x #To turn off Debug mode

# Sample -4: Checking exit status code for a command
mkdir pumpkin

if [ $? -eq 0 ]; then 
  echo "Command successful"
else
  echo "Command failed"
fi