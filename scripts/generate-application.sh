# scripts/generate-application.sh

CUSTOMER=$1
TEMPLATE="scripts/templates/application.template.yaml"
OUTPUT="applications/${CUSTOMER}.yaml"

if [[ -z "$CUSTOMER" ]]; then
  echo "❌ Thiếu tên khách hàng"
  exit 1
fi

mkdir -p applications/

cp "$TEMPLATE" "$OUTPUT"
sed -i "s/{{CUSTOMER}}/$CUSTOMER/g" "$OUTPUT"

echo "✅ Generated $OUTPUT"