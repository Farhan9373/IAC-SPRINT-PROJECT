#!/bin/bash

echo "Running Terraform Drift Detection..."

terraform plan -detailed-exitcode

EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ]; then
  echo "No drift detected."
elif [ $EXIT_CODE -eq 2 ]; then
  echo "Infrastructure drift detected!"
else
  echo "Terraform plan failed."
fi