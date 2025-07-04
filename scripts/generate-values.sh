#!/bin/bash

CUSTOMER=$1
TAG=$2
ADMIN_PASSWORD=$3

TEMPLATE="helm/erpnext/tenants/values-template.yaml"
TARGET="helm/erpnext/tenants/$CUSTOMER/values.yaml"

# Check input
if [[ -z "$CUSTOMER" || -z "$TAG" || -z "$ADMIN_PASSWORD" ]]; then
  echo "Usage: $0 <customer-name> <image-tag> <admin-password>"
  exit 1
fi

# Create folder nếu chưa có
mkdir -p "helm/erpnext/tenants/$CUSTOMER"

# Generate values.yaml từ template dùng chung
cp "$TEMPLATE" "$TARGET"

# Replace placeholders
sed -i "s/{{TAG}}/$TAG/g" "$TARGET"
sed -i "s/{{CUSTOMER}}/$CUSTOMER/g" "$TARGET"
sed -i "s/{{ADMIN_PASSWORD}}/$ADMIN_PASSWORD/g" "$TARGET"

echo "✅ Created helm/erpnext/tenants/$CUSTOMER/values.yaml"