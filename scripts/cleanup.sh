#!/bin/bash

RED='\033[0/31m'
NC='\033[0m'

echo -e "${RED}====================================================${NC}"
echo -e "${RED}⚠️  WARNING: STARTING INFRASTRUCTURE DESTRUCTION CLEANUP${NC}"
echo -e "${RED}====================================================${NC}"

# Step 1: Remove local read-only private key blocks
echo "🧹 Removing local secure key file locks..."
rm -f ../terraform/modules/keypair/k8s-key.pem

# Step 2: Tear down AWS components completely
echo -e "\n${RED}💥 Destroying all provisioned AWS Cloud resources...${NC}"
cd ../terraform
terraform destroy -auto-approve

# Step 3: Remove generated configuration traces
echo -e "\n🧹 Purging local state cache records..."
rm -f ../ansible/inventory.ini
rm -f ../ansible/admin.conf

echo -e "\n${RED}====================================================${NC}"
echo -e "${RED}✅ CLEANUP COMPLETE. AWS ACCOUNT IS SAFE FROM CHARGES!${NC}"
echo -e "${RED}====================================================${NC}"