#!/bin/bash

# start frontend
sudo docker run --network host -e KUSHO_BACKEND_URL="${KUSHO_BACKEND_URL}" -d registry.digitalocean.com/kusho-cs-on-prem/kusho_frontend:1.1 node server/server.js

# start redis
sudo docker run --network host -d redis:6.2-alpine

# start mysql and setup schema
sudo docker run --network host \
  -e MYSQL_ROOT_PASSWORD="${KUSHO_MYSQL_PASSWORD}" \
  -v ./schema.sql:/docker-entrypoint-initdb.d/init.sql \
  -v mysql_data:/var/lib/mysql \
  -d mysql:8.0 --default-authentication-plugin=mysql_native_password

# start backend
sudo docker run \
  --network host \
  -e ENVIRONMENT="${ENVIRONMENT}" \
  -e KUSHO_FRONTEND_URL="${KUSHO_FRONTEND_URL}" \
  -e KUSHO_BACKEND_URL="${KUSHO_BACKEND_URL}" \
  -e KUSHO_LLM_PROVIDER="${KUSHO_LLM_PROVIDER}" \
  -e KUSHO_MYSQL_USERNAME="${KUSHO_MYSQL_USERNAME}" \
  -e KUSHO_MYSQL_PASSWORD="${KUSHO_MYSQL_PASSWORD}" \
  -e KUSHO_MYSQL_HOST="${KUSHO_MYSQL_HOST}" \
  -e KUSHO_MYSQL_PORT="${KUSHO_MYSQL_PORT}" \
  -e KUSHO_MYSQL_DB="${KUSHO_MYSQL_DB}" \
  -e KUSHO_REDIS_HOST="${KUSHO_REDIS_HOST}" \
  -e KUSHO_REDIS_PORT="${KUSHO_REDIS_PORT}" \
  -e KUSHO_REDIS_SSL="${KUSHO_REDIS_SSL}" \
  -e KUSHO_SENDGRID_API_KEY="${KUSHO_SENDGRID_API_KEY}" \
  -e KUSHO_AWS_ACCESS_KEY_ID="${KUSHO_AWS_ACCESS_KEY_ID}" \
  -e KUSHO_AWS_SECRET_ACCESS_KEY="${KUSHO_AWS_SECRET_ACCESS_KEY}" \
  -e KUSHO_AWS_REGION="${KUSHO_AWS_REGION}" \
  -e KUSHO_AWS_BEDROCK_REGION="${KUSHO_AWS_BEDROCK_REGION}" \
  -e KUSHO_AWS_EXPORTS_BUCKET_NAME="${KUSHO_AWS_EXPORTS_BUCKET_NAME}" \
  -e KUSHO_SENTRY_DSN="${KUSHO_SENTRY_DSN}" \
  -e KUSHO_KINDE_DOMAIN="${KUSHO_KINDE_DOMAIN}" \
  -e KUSHO_KINDE_CLIENT_ID="${KUSHO_KINDE_CLIENT_ID}" \
  -e KUSHO_KINDE_CLIENT_SECRET="${KUSHO_KINDE_CLIENT_SECRET}" \
  -e KUSHO_KINDE_CODE_VERIFIER="${KUSHO_KINDE_CODE_VERIFIER}" \
  -e KUSHO_OPENAI_ORG_ID="${KUSHO_OPENAI_ORG_ID}" \
  -e KUSHO_OPENAI_API_KEY="${KUSHO_OPENAI_API_KEY}" \
  -e KUSHO_PINECONE_ASSISTANT_NAME="${KUSHO_PINECONE_ASSISTANT_NAME}" \
  -e KUSHO_PINECONE_ASSISTANT_API_KEY="${KUSHO_PINECONE_ASSISTANT_API_KEY}" \
  -e KUSHO_POSTHOG_URL="${KUSHO_POSTHOG_URL}" \
  -e KUSHO_POSTHOG_API_KEY="${KUSHO_POSTHOG_API_KEY}" \
  -e KUSHO_MAILCHIMP_API_KEY="${KUSHO_MAILCHIMP_API_KEY}" \
  -e KUSHO_MAILCHIMP_SERVER="${KUSHO_MAILCHIMP_SERVER}" \
  -e KUSHO_MAILCHIMP_KUSHO_AUDIENCE_ID="${KUSHO_MAILCHIMP_KUSHO_AUDIENCE_ID}" \
  -d registry.digitalocean.com/kusho-cs-on-prem/kusho_backend:1.2

# start rq
sudo docker run \
  --network host \
  -e ENVIRONMENT="${ENVIRONMENT}" \
  -e KUSHO_FRONTEND_URL="${KUSHO_FRONTEND_URL}" \
  -e KUSHO_BACKEND_URL="${KUSHO_BACKEND_URL}" \
  -e KUSHO_LLM_PROVIDER="${KUSHO_LLM_PROVIDER}" \
  -e KUSHO_MYSQL_USERNAME="${KUSHO_MYSQL_USERNAME}" \
  -e KUSHO_MYSQL_PASSWORD="${KUSHO_MYSQL_PASSWORD}" \
  -e KUSHO_MYSQL_HOST="${KUSHO_MYSQL_HOST}" \
  -e KUSHO_MYSQL_PORT="${KUSHO_MYSQL_PORT}" \
  -e KUSHO_MYSQL_DB="${KUSHO_MYSQL_DB}" \
  -e KUSHO_REDIS_HOST="${KUSHO_REDIS_HOST}" \
  -e KUSHO_REDIS_PORT="${KUSHO_REDIS_PORT}" \
  -e KUSHO_REDIS_SSL="${KUSHO_REDIS_SSL}" \
  -e KUSHO_SENDGRID_API_KEY="${KUSHO_SENDGRID_API_KEY}" \
  -e KUSHO_AWS_ACCESS_KEY_ID="${KUSHO_AWS_ACCESS_KEY_ID}" \
  -e KUSHO_AWS_SECRET_ACCESS_KEY="${KUSHO_AWS_SECRET_ACCESS_KEY}" \
  -e KUSHO_AWS_REGION="${KUSHO_AWS_REGION}" \
  -e KUSHO_AWS_BEDROCK_REGION="${KUSHO_AWS_BEDROCK_REGION}" \
  -e KUSHO_AWS_EXPORTS_BUCKET_NAME="${KUSHO_AWS_EXPORTS_BUCKET_NAME}" \
  -e KUSHO_SENTRY_DSN="${KUSHO_SENTRY_DSN}" \
  -e KUSHO_KINDE_DOMAIN="${KUSHO_KINDE_DOMAIN}" \
  -e KUSHO_KINDE_CLIENT_ID="${KUSHO_KINDE_CLIENT_ID}" \
  -e KUSHO_KINDE_CLIENT_SECRET="${KUSHO_KINDE_CLIENT_SECRET}" \
  -e KUSHO_KINDE_CODE_VERIFIER="${KUSHO_KINDE_CODE_VERIFIER}" \
  -e KUSHO_OPENAI_ORG_ID="${KUSHO_OPENAI_ORG_ID}" \
  -e KUSHO_OPENAI_API_KEY="${KUSHO_OPENAI_API_KEY}" \
  -e KUSHO_PINECONE_ASSISTANT_NAME="${KUSHO_PINECONE_ASSISTANT_NAME}" \
  -e KUSHO_PINECONE_ASSISTANT_API_KEY="${KUSHO_PINECONE_ASSISTANT_API_KEY}" \
  -e KUSHO_POSTHOG_URL="${KUSHO_POSTHOG_URL}" \
  -e KUSHO_POSTHOG_API_KEY="${KUSHO_POSTHOG_API_KEY}" \
  -e KUSHO_MAILCHIMP_API_KEY="${KUSHO_MAILCHIMP_API_KEY}" \
  -e KUSHO_MAILCHIMP_SERVER="${KUSHO_MAILCHIMP_SERVER}" \
  -e KUSHO_MAILCHIMP_KUSHO_AUDIENCE_ID="${KUSHO_MAILCHIMP_KUSHO_AUDIENCE_ID}" \
  -d registry.digitalocean.com/kusho-cs-on-prem/kusho_backend:1.2 rq worker

# start jobs
sudo docker run \
  --network host \
  -e ENVIRONMENT="${ENVIRONMENT}" \
  -e KUSHO_FRONTEND_URL="${KUSHO_FRONTEND_URL}" \
  -e KUSHO_BACKEND_URL="${KUSHO_BACKEND_URL}" \
  -e KUSHO_LLM_PROVIDER="${KUSHO_LLM_PROVIDER}" \
  -e KUSHO_MYSQL_USERNAME="${KUSHO_MYSQL_USERNAME}" \
  -e KUSHO_MYSQL_PASSWORD="${KUSHO_MYSQL_PASSWORD}" \
  -e KUSHO_MYSQL_HOST="${KUSHO_MYSQL_HOST}" \
  -e KUSHO_MYSQL_PORT="${KUSHO_MYSQL_PORT}" \
  -e KUSHO_MYSQL_DB="${KUSHO_MYSQL_DB}" \
  -e KUSHO_REDIS_HOST="${KUSHO_REDIS_HOST}" \
  -e KUSHO_REDIS_PORT="${KUSHO_REDIS_PORT}" \
  -e KUSHO_REDIS_SSL="${KUSHO_REDIS_SSL}" \
  -e KUSHO_SENDGRID_API_KEY="${KUSHO_SENDGRID_API_KEY}" \
  -e KUSHO_AWS_ACCESS_KEY_ID="${KUSHO_AWS_ACCESS_KEY_ID}" \
  -e KUSHO_AWS_SECRET_ACCESS_KEY="${KUSHO_AWS_SECRET_ACCESS_KEY}" \
  -e KUSHO_AWS_REGION="${KUSHO_AWS_REGION}" \
  -e KUSHO_AWS_BEDROCK_REGION="${KUSHO_AWS_BEDROCK_REGION}" \
  -e KUSHO_AWS_EXPORTS_BUCKET_NAME="${KUSHO_AWS_EXPORTS_BUCKET_NAME}" \
  -e KUSHO_SENTRY_DSN="${KUSHO_SENTRY_DSN}" \
  -e KUSHO_KINDE_DOMAIN="${KUSHO_KINDE_DOMAIN}" \
  -e KUSHO_KINDE_CLIENT_ID="${KUSHO_KINDE_CLIENT_ID}" \
  -e KUSHO_KINDE_CLIENT_SECRET="${KUSHO_KINDE_CLIENT_SECRET}" \
  -e KUSHO_KINDE_CODE_VERIFIER="${KUSHO_KINDE_CODE_VERIFIER}" \
  -e KUSHO_OPENAI_ORG_ID="${KUSHO_OPENAI_ORG_ID}" \
  -e KUSHO_OPENAI_API_KEY="${KUSHO_OPENAI_API_KEY}" \
  -e KUSHO_PINECONE_ASSISTANT_NAME="${KUSHO_PINECONE_ASSISTANT_NAME}" \
  -e KUSHO_PINECONE_ASSISTANT_API_KEY="${KUSHO_PINECONE_ASSISTANT_API_KEY}" \
  -e KUSHO_POSTHOG_URL="${KUSHO_POSTHOG_URL}" \
  -e KUSHO_POSTHOG_API_KEY="${KUSHO_POSTHOG_API_KEY}" \
  -e KUSHO_MAILCHIMP_API_KEY="${KUSHO_MAILCHIMP_API_KEY}" \
  -e KUSHO_MAILCHIMP_SERVER="${KUSHO_MAILCHIMP_SERVER}" \
  -e KUSHO_MAILCHIMP_KUSHO_AUDIENCE_ID="${KUSHO_MAILCHIMP_KUSHO_AUDIENCE_ID}" \
  -e PYTHONPATH="/app" \
  -d registry.digitalocean.com/kusho-cs-on-prem/kusho_backend:1.2 sh -c "while true; do python3 jobs/test_cases_generation.py prod; sleep 10; done"
