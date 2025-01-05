

# active project
gcloud config set project sky-cloud-run
# check billing - billing Menu > Billing> Billing Account

# update secrete value







# check identity pool
gcloud iam workload-identity-pools list --location="global"


gcloud secrets versions access latest --secret=db_password
echo -n "NEW_SECRET_VALUE" | gcloud secrets versions add <SECRET_NAME> --data-file=-
echo -n "my-updated-password" | gcloud secrets versions add db-password --data-file=-

gcloud secrets versions list db-password
gcloud secrets versions access latest --secret=db-password


gcloud iam service-accounts list

gcloud projects add-iam-policy-binding YOUR_PROJECT_ID \
  --member="serviceAccount:SERVICE_ACCOUNT_EMAIL" \
  --role="roles/cloudsql.client"

# directory ~/cloudshell_open/python-docs-samples/cloud-sql/mysql/sqlalchemy
gcloud builds submit --tag gcr.io/sky-cloud-run/run-sql


gcloud run deploy run-sql --image gcr.io/YOUR_PROJECT_ID/run-sql \
  --add-cloudsql-instances INSTANCE_CONNECTION_NAME \
  --set-env-vars INSTANCE_UNIX_SOCKET="/cloudsql/INSTANCE_CONNECTION_NAME" \
  --set-env-vars INSTANCE_CONNECTION_NAME="INSTANCE_CONNECTION_NAME" \
  --set-env-vars DB_NAME="quickstart-db" \
  --set-env-vars DB_USER="quickstart-user" \
  --set-env-vars DB_PASS="DB_PASS"

  gcloud run deploy run-sql --image gcr.io/sky-cloud-run/run-sql \
  --add-cloudsql-instances sky-cloud-run:us-central1:sky-sql \
  --set-env-vars INSTANCE_UNIX_SOCKET="/cloudsql/sky-cloud-run:us-central1:sky-sql" \
  --set-env-vars INSTANCE_CONNECTION_NAME="sky-cloud-run:us-central1:sky-sql" \
  --set-env-vars DB_NAME="sky-db" \
  --set-env-vars DB_USER="db_user" \
  --set-env-vars DB_PASS="db_password"