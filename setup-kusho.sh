#!/bin/bash

# Check if Docker is installed
if ! command -v docker &> /dev/null
then
    echo "Docker is not installed. Installing now..."
    
    # Update the package list
    sudo apt-get update -y

    # Install prerequisites
    sudo apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common

    # Add Docker's official GPG key
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    # Add Docker repository
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Update the package list again
    sudo apt-get update -y

    # Install Docker
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io

    # Enable Docker service
    sudo systemctl enable docker
    sudo systemctl start docker

    echo "Docker has been successfully installed."
else
    echo "Docker is already installed."
    docker --version
fi

# Environment setup
export ENVIRONMENT="prod"

# URLs
export KUSHO_FRONTEND_URL="http://localhost:5173"
export KUSHO_BACKEND_URL="http://localhost:8080"

# LLM
export KUSHO_LLM_PROVIDER="openai"

# MySQL
export KUSHO_MYSQL_USERNAME="admin"
export KUSHO_MYSQL_PASSWORD="helloworld"
export KUSHO_MYSQL_HOST="127.0.0.1"
export KUSHO_MYSQL_PORT=3306
export KUSHO_MYSQL_DB="testing"

# Redis
export KUSHO_REDIS_HOST="127.0.0.1"
export KUSHO_REDIS_PORT=6379
export KUSHO_REDIS_SSL="false"

# SendGrid
export KUSHO_SENDGRID_API_KEY=""

# AWS
export KUSHO_AWS_ACCESS_KEY_ID=""
export KUSHO_AWS_SECRET_ACCESS_KEY=""
export KUSHO_AWS_REGION=""
export KUSHO_AWS_BEDROCK_REGION=""
export KUSHO_AWS_EXPORTS_BUCKET_NAME=""

# Sentry
export KUSHO_SENTRY_DSN=""

# Kinde
export KUSHO_KINDE_DOMAIN=""
export KUSHO_KINDE_CLIENT_ID=""
export KUSHO_KINDE_CLIENT_SECRET=""
export KUSHO_KINDE_CODE_VERIFIER=""

# OpenAI
export KUSHO_OPENAI_ORG_ID=""
export KUSHO_OPENAI_API_KEY=""

# Pinecone
export KUSHO_PINECONE_ASSISTANT_NAME=""
export KUSHO_PINECONE_ASSISTANT_API_KEY=""

# Posthog
export KUSHO_POSTHOG_URL=""
export KUSHO_POSTHOG_API_KEY=""
