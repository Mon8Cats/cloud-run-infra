#!/bin/bash

# Variables
PROJECT_ID="your-project-id" # Replace with your GCP project ID
SECRET_NAME="your-secret-name" # Replace with your secret name
VERSION="latest" # Replace with the secret version, or keep as 'latest'

# Fetch the secret value
SECRET_VALUE=$(gcloud secrets versions access "$VERSION" \
  --secret="$SECRET_NAME" \
  --project="$PROJECT_ID")

# Output the secret value
echo "Secret Value: $SECRET_VALUE"

## make it executable and run
# chmod +x get-secret.sh
# ./get-secret.sh


