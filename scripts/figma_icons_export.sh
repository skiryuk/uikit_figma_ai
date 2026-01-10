#!/bin/bash

# Figma API Helper Script - Icons Export to SVG
# Выгрузка иконок из Figma компонентов в SVG формате
#
# Usage:
#   ./scripts/figma_icons_export.sh <FIGMA_TOKEN> <FILE_ID> [COMPONENT_SET_NAME] [OUTPUT_DIR] [START_NODE_ID]
#
# Example:
#   ./scripts/figma_icons_export.sh figd_xxx... ABC "Icons" assets/icons
#   ./scripts/figma_icons_export.sh figd_xxx... ABC "" assets/icons "0:123"
#
# Параметры:
#   FIGMA_TOKEN - токен Figma API
#   FILE_ID - ID файла Figma
#   COMPONENT_SET_NAME - (опционально) имя компонента или набор компонентов для фильтрации
#                        Если не указано, будут выгружены все компоненты
#   OUTPUT_DIR - (опционально) папка для сохранения (по умолчанию: assets/icons)
#   START_NODE_ID - (опционально) node ID, с которого начинать поиск компонентов
#                   Если не указано, поиск начинается с корня документа

set -e

# Используем переменные окружения как значения по умолчанию
FIGMA_TOKEN=${1:-${FIGMA_TOKEN:-""}}
FILE_ID=${2:-${FIGMA_FILE:-""}}
COMPONENT_FILTER=${3:-""}
OUTPUT_DIR=${4:-"assets/icons"}
START_NODE_ID=${5:-""}

if [ -z "$FIGMA_TOKEN" ] || [ -z "$FILE_ID" ]; then
    echo "Usage: $0 [FIGMA_TOKEN] [FILE_ID] [COMPONENT_SET_NAME] [OUTPUT_DIR] [START_NODE_ID]"
    echo ""
    echo "Параметры могут быть переданы как аргументы или через переменные окружения:"
    echo "  FIGMA_TOKEN - токен Figma API (или \$FIGMA_TOKEN)"
    echo "  FILE_ID - ID файла Figma (или \$FIGMA_FILE)"
    echo "  COMPONENT_SET_NAME - (опционально) фильтр по имени компонента"
    echo "  OUTPUT_DIR - (опционально) папка для сохранения (по умолчанию: assets/icons)"
    echo "  START_NODE_ID - (опционально) node ID для начала поиска (например: 0:123)"
    echo ""
    echo "Примеры:"
    echo "  $0 figd_xxx... ABC \"Icons\" assets/icons"
    echo "  $0  # использует FIGMA_TOKEN и FIGMA_FILE из окружения"
    echo "  $0 \"\" \"\" \"Icons\" \"\" \"0:123\"  # использует переменные окружения с фильтром и node ID"
    echo ""
    echo "Этот скрипт использует:"
    echo "  - GET /v1/files/{file_key} для получения структуры файла"
    echo "  - GET /v1/images/{file_key} для экспорта в SVG"
    exit 1
fi

# Создаем папку для иконок
mkdir -p "$OUTPUT_DIR"

echo "🎨 Выгрузка иконок из Figma..."
echo "File ID: $FILE_ID"
echo "Output: $OUTPUT_DIR"
if [ -n "$COMPONENT_FILTER" ]; then
    echo "Фильтр: $COMPONENT_FILTER"
fi
if [ -n "$START_NODE_ID" ]; then
    echo "Начальный Node ID: $START_NODE_ID"
fi
echo ""

# Шаг 1: Получаем структуру файла
echo "📥 Получение структуры файла..."
RESPONSE=$(curl -s -w "\n%{http_code}" \
    -H "X-Figma-Token: $FIGMA_TOKEN" \
    "https://api.figma.com/v1/files/$FILE_ID")

HTTP_CODE=$(echo "$RESPONSE" | tail -n1)
BODY=$(echo "$RESPONSE" | sed '$d')

if [ "$HTTP_CODE" -ne 200 ]; then
    if [ "$HTTP_CODE" -eq 429 ]; then
        echo "❌ Превышен лимит запросов!"
        RETRY_AFTER=$(echo "$BODY" | jq -r '.retry_after // "unknown"' 2>/dev/null || echo "unknown")
        echo "Повторить через: $RETRY_AFTER секунд"
        exit 1
    else
        echo "❌ Ошибка: HTTP $HTTP_CODE"
        echo "$BODY"
        exit 1
    fi
fi

if ! command -v jq &> /dev/null; then
    echo "❌ Ошибка: jq не установлен. Установите jq для работы скрипта."
    echo "   macOS: brew install jq"
    echo "   Ubuntu: sudo apt-get install jq"
    exit 1
fi

# Шаг 2: Извлекаем все компоненты
echo "🔍 Поиск компонентов..."

# Определяем начальный узел для поиска
if [ -n "$START_NODE_ID" ]; then
    # Если указан START_NODE_ID, находим узел в структуре файла и начинаем поиск с него
    # Сначала находим узел с указанным ID в дереве документа
    ROOT_NODE=$(echo "$BODY" | jq -r --arg node_id "$START_NODE_ID" '
      def find_node(node):
        if node.id == $node_id then
          node
        elif node.children then
          node.children | map(find_node(.)) | add // empty
        else
          empty
        end;
      
      .document | find_node(.)
    ' 2>/dev/null)
    
    if [ -z "$ROOT_NODE" ] || [ "$ROOT_NODE" == "null" ]; then
        echo "❌ Узел с ID $START_NODE_ID не найден в файле"
        echo "Проверьте, что node ID корректный и доступен в файле"
        exit 1
    fi
    
    echo "✅ Найден узел: $(echo "$ROOT_NODE" | jq -r '.name' 2>/dev/null || echo "$START_NODE_ID")"
    
    # Собираем компоненты начиная с указанного узла
    COMPONENTS=$(echo "$ROOT_NODE" | jq -r '
      def find_components(node; path):
        (if node.type == "COMPONENT" or node.type == "COMPONENT_SET" then 
          [{
            id: node.id,
            name: node.name,
            path: (if path == "" then node.name else path + "/" + node.name end)
          }]
        else [] end) +
        (if node.children then
          (node.children | map(find_components(.; if path == "" then node.name else path + "/" + node.name end)) | add // [])
        else [] end);
      
      find_components(.; "") | .[]
    ' 2>/dev/null)
else
    # Собираем все node_id компонентов и их имена, начиная с корня документа
    COMPONENTS=$(echo "$BODY" | jq -r '
      def find_components(node; path):
        (if node.type == "COMPONENT" or node.type == "COMPONENT_SET" then 
          [{
            id: node.id,
            name: node.name,
            path: (path + "/" + node.name)
          }]
        else [] end) +
        (if node.children then
          (node.children | map(find_components(.; path + "/" + node.name)) | add // [])
        else [] end);
      
      .document | find_components(.; "") | .[]
    ' 2>/dev/null)
fi

if [ -z "$COMPONENTS" ] || [ "$COMPONENTS" == "null" ]; then
    echo "❌ Компоненты не найдены в файле"
    exit 1
fi

# Фильтруем компоненты по имени, если указан фильтр
if [ -n "$COMPONENT_FILTER" ]; then
    COMPONENTS=$(echo "$COMPONENTS" | jq -r --arg filter "$COMPONENT_FILTER" '
      select(.name | test($filter; "i"))
    ')
fi

# Подсчитываем количество
COMPONENT_COUNT=$(echo "$COMPONENTS" | jq -s 'length')
echo "✅ Найдено компонентов: $COMPONENT_COUNT"
echo ""

if [ "$COMPONENT_COUNT" -eq 0 ]; then
    echo "❌ Компоненты, соответствующие фильтру, не найдены"
    exit 1
fi

# Шаг 3: Извлекаем ID компонентов
NODE_IDS=$(echo "$COMPONENTS" | jq -r '.id' | tr '\n' ',' | sed 's/,$//')
COMPONENT_NAMES=$(echo "$COMPONENTS" | jq -r '.name' | tr '\n' '\0')

# Шаг 4: Запрашиваем экспорт изображений в SVG
echo "📤 Запрос экспорта в SVG..."
EXPORT_RESPONSE=$(curl -s -w "\n%{http_code}" \
    -H "X-Figma-Token: $FIGMA_TOKEN" \
    "https://api.figma.com/v1/images/$FILE_ID?ids=$NODE_IDS&format=svg")

EXPORT_HTTP_CODE=$(echo "$EXPORT_RESPONSE" | tail -n1)
EXPORT_BODY=$(echo "$EXPORT_RESPONSE" | sed '$d')

if [ "$EXPORT_HTTP_CODE" -ne 200 ]; then
    if [ "$EXPORT_HTTP_CODE" -eq 429 ]; then
        echo "❌ Превышен лимит запросов при экспорте!"
        RETRY_AFTER=$(echo "$EXPORT_BODY" | jq -r '.retry_after // "unknown"' 2>/dev/null || echo "unknown")
        echo "Повторить через: $RETRY_AFTER секунд"
        exit 1
    else
        echo "❌ Ошибка экспорта: HTTP $EXPORT_HTTP_CODE"
        echo "$EXPORT_BODY"
        exit 1
    fi
fi

# Шаг 5: Скачиваем SVG файлы
echo "💾 Скачивание иконок..."
echo ""

# Сохраняем компоненты во временный файл для обработки
TEMP_FILE=$(mktemp)
echo "$COMPONENTS" | jq -c '.' > "$TEMP_FILE"

SUCCESS_COUNT=0
FAIL_COUNT=0

# Обрабатываем каждый компонент
while IFS= read -r component; do
    ID=$(echo "$component" | jq -r '.id')
    NAME=$(echo "$component" | jq -r '.name')
    
    # Нормализуем имя файла (убираем спецсимволы, заменяем пробелы на подчеркивания)
    FILENAME=$(echo "$NAME" | sed 's/[^a-zA-Z0-9_-]/_/g' | tr '[:upper:]' '[:lower:]' | sed 's/__*/_/g')
    
    # Получаем URL из ответа API
    URL=$(echo "$EXPORT_BODY" | jq -r --arg id "$ID" ".images[\"$id\"] // empty" 2>/dev/null)
    
    if [ -z "$URL" ] || [ "$URL" == "null" ] || [ "$URL" == "" ]; then
        # Пробуем найти URL без использования переменной arg
        URL=$(echo "$EXPORT_BODY" | jq -r ".images.\"$ID\" // empty" 2>/dev/null)
    fi
    
    if [ -z "$URL" ] || [ "$URL" == "null" ] || [ "$URL" == "" ]; then
        echo "⚠️  Пропущено: $NAME (ID: $ID, URL не найден)"
        FAIL_COUNT=$((FAIL_COUNT + 1))
        continue
    fi
    
    # Скачиваем SVG
    OUTPUT_FILE="$OUTPUT_DIR/${FILENAME}.svg"
    HTTP_CODE=$(curl -s -w "%{http_code}" -o "$OUTPUT_FILE" "$URL" 2>/dev/null || echo "000")
    
    # Извлекаем только код ответа из последней строки
    HTTP_CODE_ONLY=$(echo "$HTTP_CODE" | tail -c 4 | tr -d '\n')
    
    if [ "$HTTP_CODE_ONLY" = "200" ]; then
        echo "✅ $NAME -> ${FILENAME}.svg"
        SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
    else
        echo "❌ Ошибка скачивания: $NAME (HTTP $HTTP_CODE_ONLY)"
        FAIL_COUNT=$((FAIL_COUNT + 1))
        rm -f "$OUTPUT_FILE"
    fi
    
    # Небольшая задержка, чтобы не превысить лимиты
    sleep 0.1
done < "$TEMP_FILE"

# Удаляем временный файл
rm -f "$TEMP_FILE"

echo ""
echo "📊 Результаты:"
echo "   ✅ Успешно: $SUCCESS_COUNT"
echo "   ❌ Ошибок: $FAIL_COUNT"
echo "   📁 Папка: $OUTPUT_DIR"
echo ""
echo "✨ Готово!"

