#!/bin/bash

CUSTOMER=$1
TAG=$2

TARGET="tenants/${CUSTOMER}/values.yaml"

if [[ ! -f "$TARGET" ]]; then
  echo "❌ values.yaml not found for $CUSTOMER"
  exit 1
fi

sed -i "s/^\( *erpnextImage:\s*.*:\).*/\1$TAG/" "$TARGET"
sed -i "s/^\( *frappeImage:\s*.*:\).*/\1$TAG/" "$TARGET"

echo "🔁 Updated image tag in $TARGET → $TAG"