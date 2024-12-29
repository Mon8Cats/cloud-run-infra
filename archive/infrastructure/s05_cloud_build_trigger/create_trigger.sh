#!/bin/bash

# Input Variables
PROJECT_ID="sky-root"
REGION="us-central1" 
TRIGGER_NAME="sky-dev-infra" 
REPO_NAME="sky-dev-infra"
BRANCH_PATTERN=".*"
CLOUDBUILD_FILE="cloudbuild.yaml"
CUSTOM_SA="cicd-sa-infra@$PROJECT_ID.iam.gserviceaccount.com"

gcloud beta builds triggers create repository \
    --project="$PROJECT_ID" \
    --region="$REGION" \
    --name="$TRIGGER_NAME" \
    --repository="$REPO_NAME" \
    --branch-pattern="$BRANCH_PATTERN" \
    --build-config="$CLOUDBUILD_FILE" \
    --substitutions=_PROJECT_ID="$PROJECT_ID",_REGION="$REGION" \
    --service-account="$CUSTOM_SA"

# how to run script
# chmod +x create_trigger.sh
# ./create_trigger.sh


# gcloud builds connections list --region="us-central1"