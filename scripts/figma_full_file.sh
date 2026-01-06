#!/bin/bash

# Figma API Helper Script - Full File Export
# Direct access to Figma API to fetch the entire file
#
# Usage:
#   ./scripts/figma_full_file.sh <FIGMA_TOKEN> <FILE_ID> [OUTPUT_NAME]
#
# Example:
#   ./scripts/figma_full_file.sh figd_xxx... ABC figma_app

set -e

if [ $# -lt 2 ]; then
    echo "Usage: $0 <FIGMA_TOKEN> <FILE_ID> [OUTPUT_NAME]"
    echo ""
    echo "Example:"
    echo "  $0 figd_xxx... ABC figma_app"
    exit 1
fi

FIGMA_TOKEN=$1
FILE_ID=$2
OUTPUT_NAME=${3:-"figma_full_file"}

echo "Fetching full file from Figma..."
echo "File ID: $FILE_ID"
echo "Output: ${OUTPUT_NAME}.json"
echo ""

RESPONSE=$(curl -s -w "\n%{http_code}" \
    -H "X-Figma-Token: $FIGMA_TOKEN" \
    "https://api.figma.com/v1/files/$FILE_ID")

HTTP_CODE=$(echo "$RESPONSE" | tail -n1)
BODY=$(echo "$RESPONSE" | sed '$d')

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "✅ Success!"
    echo ""
    
    # Save to file
    OUTPUT_FILE="${OUTPUT_NAME}.json"
    echo "$BODY" | jq '.' > "$OUTPUT_FILE" 2>/dev/null || echo "$BODY" > "$OUTPUT_FILE"
    echo "💾 Saved to: $OUTPUT_FILE"
    
    # Show file size
    FILE_SIZE=$(wc -c < "$OUTPUT_FILE" | tr -d ' ')
    echo "📦 File size: $(numfmt --to=iec-i --suffix=B $FILE_SIZE 2>/dev/null || echo "${FILE_SIZE} bytes")"
elif [ "$HTTP_CODE" -eq 429 ]; then
    echo "❌ Rate limit exceeded!"
    RETRY_AFTER=$(echo "$BODY" | jq -r '.retry_after // "unknown"' 2>/dev/null || echo "unknown")
    echo "Retry after: $RETRY_AFTER seconds"
    exit 1
else
    echo "❌ Error: HTTP $HTTP_CODE"
    echo "$BODY"
    exit 1
fi


