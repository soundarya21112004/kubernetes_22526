#!/bin/bash

# Exit immediately if any command fails
set -e

# Color codes for clean output display
GREEN='\033[0/32m'
NC='\033[0m' # No Color
echo -e "${GREEN}====================================================${NC}"
echo -e "${GREEN}🚀 STARTING FULL DEVOPS PLATFORM AUTOMATION PIPELINE${NC}"
echo -e "${GREEN}====================================================${NC}"

# Step 1: Pre-requisite validation checks
echo "🔍 Checking local machine binaries dependencies..."
for cmd in terraform ansible; do
    if ! command -v $cmd &> /dev/null; then
        echo "❌ Error: $cmd is not installed on your laptop. Please install it first."
        exit 1
    fi
done
echo "✅ Tooling validation checks passed!"

# Step 2: Spin up AWS Infrastructure via Terraform
echo -e "\n${GREEN}🏗️  Step 1: Provisioning Infrastructure on AWS...${NC}"
cd ../terraform
terraform init
terraform apply -auto-approve

# Step 3: Wait for AWS instances to stabilize boot routines
echo -e "\n${GREEN}⏳ Step 2: Allowing 30 seconds for AWS EC2 SSH daemons to boot up...${NC}"
sleep 30

# Step 4: Run Ansible Configuration on instances
echo -e "\n${GREEN}⚙️  Step 3: Configuring Kubernetes Cluster via Ansible...${NC}"
cd ../ansible
ansible-playbook playbook.yml

echo -e "\n${GREEN}====================================================${NC}"
echo -e "${GREEN}🎉 CONGRATULATIONS! YOUR PLATFORM IS FULLY PROVISIONED${NC}"
echo -e "${GREEN}====================================================${NC}"