#!/bin/bash

# Figma API Helper Script - Variables Export
# Экспорт переменных (Variables) и коллекций переменных из Figma файла
#
# Usage:
#   ./scripts/figma_variables.sh <FIGMA_TOKEN> <FILE_ID> [OUTPUT_NAME]
#
# Example:
#   ./scripts/figma_variables.sh figd_xxx... ABC figma_variables

set -e

if [ $# -lt 2 ]; then
    echo "Usage: $0 <FIGMA_TOKEN> <FILE_ID> [OUTPUT_NAME]"
    echo ""
    echo "Example:"
    echo "  $0 figd_xxx... ABC figma_variables"
    echo ""
    echo "Этот скрипт использует endpoint: GET /v1/files/{file_key}/variables/local"
    exit 1
fi

FIGMA_TOKEN=$1
FILE_ID=$2
OUTPUT_NAME=${3:-"figma_variables"}

echo "Выгрузка переменных из Figma..."
echo "File ID: $FILE_ID"
echo "Output: ${OUTPUT_NAME}.json"
echo ""

RESPONSE=$(curl -s -w "\n%{http_code}" \
    -H "X-Figma-Token: $FIGMA_TOKEN" \
    "https://api.figma.com/v1/files/$FILE_ID/variables/local")

HTTP_CODE=$(echo "$RESPONSE" | tail -n1)
BODY=$(echo "$RESPONSE" | sed '$d')

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "✅ Успешно!"
    echo ""
    
    # Save to file
    OUTPUT_FILE="${OUTPUT_NAME}.json"
    echo "$BODY" | jq '.' > "$OUTPUT_FILE" 2>/dev/null || echo "$BODY" > "$OUTPUT_FILE"
    echo "💾 Сохранено в: $OUTPUT_FILE"
    
    # Show file size
    FILE_SIZE=$(wc -c < "$OUTPUT_FILE" | tr -d ' ')
    echo "📦 Размер файла: $(numfmt --to=iec-i --suffix=B $FILE_SIZE 2>/dev/null || echo "${FILE_SIZE} bytes")"
    
    # Show statistics
    if command -v jq &> /dev/null; then
        COLLECTIONS_COUNT=$(echo "$BODY" | jq '.meta.variableCollections | length' 2>/dev/null || echo "0")
        VARIABLES_COUNT=$(echo "$BODY" | jq '.meta.variables | length' 2>/dev/null || echo "0")
        echo ""
        echo "📊 Статистика:"
        echo "   Коллекций переменных: $COLLECTIONS_COUNT"
        echo "   Переменных: $VARIABLES_COUNT"
    fi
elif [ "$HTTP_CODE" -eq 429 ]; then
    echo "❌ Превышен лимит запросов!"
    RETRY_AFTER=$(echo "$BODY" | jq -r '.retry_after // "unknown"' 2>/dev/null || echo "unknown")
    echo "Повторить через: $RETRY_AFTER секунд"
    exit 1
else
    echo "❌ Ошибка: HTTP $HTTP_CODE"
    echo "$BODY"
    exit 1
fi

