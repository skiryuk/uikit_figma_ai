# Экспорт Variables через Figma Plugin

Если у вас нет Enterprise аккаунта, можно использовать плагин для экспорта Variables.

## Вариант 1: Использовать готовый плагин

1. Откройте Figma
2. Установите плагин **"Design Tokens"** или **"Figma Tokens"**
3. Экспортируйте Variables через интерфейс плагина

## Вариант 2: Создать собственный плагин

Создайте плагин со следующим кодом:

```javascript
// code.ts
figma.showUI(__html__, { width: 300, height: 400 });

figma.ui.onmessage = async (msg) => {
  if (msg.type === 'export-variables') {
    try {
      // Получаем все коллекции переменных
      const collections = await figma.variables.getLocalVariableCollectionsAsync();
      
      // Получаем все переменные
      const variables = await figma.variables.getLocalVariablesAsync();
      
      // Формируем структуру данных
      const result = {
        variableCollections: {},
        variables: {}
      };
      
      // Обрабатываем коллекции
      for (const collection of collections) {
        result.variableCollections[collection.id] = {
          id: collection.id,
          name: collection.name,
          modes: collection.modes.map(mode => ({
            modeId: mode.modeId,
            name: mode.name
          })),
          defaultModeId: collection.defaultModeId
        };
      }
      
      // Обрабатываем переменные
      for (const variable of variables) {
        const valuesByMode = {};
        const collection = await figma.variables.getVariableCollectionByIdAsync(variable.variableCollectionId);
        
        if (collection) {
          for (const mode of collection.modes) {
            const value = variable.valuesByMode[mode.modeId];
            if (value !== undefined) {
              // Преобразуем значение в зависимости от типа
              if (typeof value === 'object' && 'r' in value) {
                // Цвет
                valuesByMode[mode.modeId] = {
                  r: value.r,
                  g: value.g,
                  b: value.b,
                  a: value.a !== undefined ? value.a : 1
                };
              } else {
                valuesByMode[mode.modeId] = value;
              }
            }
          }
        }
        
        result.variables[variable.id] = {
          id: variable.id,
          name: variable.name,
          resolvedType: variable.resolvedType,
          variableCollectionId: variable.variableCollectionId,
          scopes: variable.scopes,
          valuesByMode: valuesByMode
        };
      }
      
      // Отправляем результат в UI
      figma.ui.postMessage({
        type: 'export-result',
        data: result
      });
    } catch (error) {
      figma.ui.postMessage({
        type: 'export-error',
        error: error.message
      });
    }
  }
};
```

## Вариант 3: Извлечь из обычного файла (ограниченно)

Можно попробовать извлечь информацию о переменных из обычного ответа API, но там будут только ID переменных в `boundVariables`, без значений.

