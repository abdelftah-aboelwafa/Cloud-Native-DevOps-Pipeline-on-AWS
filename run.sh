#!/bin/bash

set -e  

echo "🚀 Starting DevOps Project..."

cd terraform

echo "🔧 Initializing Terraform..."
terraform init

echo "📋 Validating..."
terraform validate

echo "📦 Planning..."
terraform plan

echo "🔥 Applying Infrastructure..."
terraform apply -auto-approve

echo "✅ Infrastructure + Ansible completed!"

echo "🎉 Project is ready!"