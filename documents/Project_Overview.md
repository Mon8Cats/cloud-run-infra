# Project Overview

## Create Google Cloud Project

```bash
# create a project in cloud console
# select the project
# IAM / permissions for project [project_id]
# IAM & Admin > service accounts
# IAM & Admin > settings > project name, project id, project number
gcloud projects list
gcloud config set project [project_id]
```

## Google Cloud Shell

## Enable APIs

```bash
gcloud services list 
gcloud services list --enabled
gcloud services list --enabled --filter="NAME:API_NAME"
```

## Cloud Storage Bucket

```bash
# create bucket for terraform backend using terraform configuration
```

## Secret Manager

## Terraform Commands

```bash
terraform init
terraform fmt
terraform plan
terraform apply
```

## Delete Google Cloud Projects

```bash
# IAM & Admin > Settings > Shut Down
gcloud auth login
gcloud auth list
gcloud config set project [project_id]
gcloud config delete [project_id]
gcloud projects list --filter="lifecycleState=DELETE_REQUESTED"

```
