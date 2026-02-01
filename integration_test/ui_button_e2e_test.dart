import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:uikit_ai_sandbox/core/theme/app_theme.dart';
import 'package:uikit_ai_sandbox/ui/widgets/ui_button.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('UiButton E2E тесты', () {
    testWidgets('Кнопка отображается и реагирует на нажатие', (WidgetTester tester) async {
      // Создаем провайдер темы
      final themeProvider = AppThemeProvider();
      
      // Переменная для отслеживания нажатий
      bool buttonPressed = false;

      // Создаем простое приложение с кнопкой
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: UiButton(
                text: 'Тестовая кнопка',
                themeProvider: themeProvider,
                onPressed: () {
                  buttonPressed = true;
                },
              ),
            ),
          ),
        ),
      );

      // Ждем отрисовки
      await tester.pumpAndSettle();

      // Проверяем, что кнопка отображается
      expect(find.text('Тестовая кнопка'), findsOneWidget);

      // Проверяем, что кнопка еще не была нажата
      expect(buttonPressed, false);

      // Нажимаем на кнопку
      await tester.tap(find.text('Тестовая кнопка'));
      await tester.pumpAndSettle();

      // Проверяем, что кнопка была нажата
      expect(buttonPressed, true);
    });

    testWidgets('Отключенная кнопка не реагирует на нажатие', (WidgetTester tester) async {
      final themeProvider = AppThemeProvider();
      bool buttonPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: UiButton(
                text: 'Отключенная кнопка',
                themeProvider: themeProvider,
                state: UiButtonState.disabled,
                onPressed: () {
                  buttonPressed = true;
                },
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Проверяем, что кнопка отображается
      expect(find.text('Отключенная кнопка'), findsOneWidget);

      // Пытаемся нажать на отключенную кнопку
      await tester.tap(find.text('Отключенная кнопка'));
      await tester.pumpAndSettle();

      // Проверяем, что кнопка не была нажата
      expect(buttonPressed, false);
    });

    testWidgets('Кнопка с иконками отображается корректно', (WidgetTester tester) async {
      final themeProvider = AppThemeProvider();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: UiButton(
                text: 'Кнопка с иконками',
                leftIcon: Icons.favorite,
                rightIcon: Icons.arrow_forward,
                themeProvider: themeProvider,
                onPressed: () {},
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Проверяем, что текст кнопки отображается
      expect(find.text('Кнопка с иконками'), findsOneWidget);

      // Проверяем, что иконки отображаются (ищем по типу Icon)
      expect(find.byType(Icon), findsNWidgets(2));
    });

    testWidgets('Кнопка с разными типами отображается', (WidgetTester tester) async {
      final themeProvider = AppThemeProvider();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiButton(
                  text: 'Accent',
                  themeProvider: themeProvider,
                  type: UiButtonType.accent,
                  onPressed: () {},
                ),
                const SizedBox(height: 16),
                UiButton(
                  text: 'Success',
                  themeProvider: themeProvider,
                  type: UiButtonType.success,
                  onPressed: () {},
                ),
                const SizedBox(height: 16),
                UiButton(
                  text: 'Critical',
                  themeProvider: themeProvider,
                  type: UiButtonType.critical,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Проверяем, что все кнопки отображаются
      expect(find.text('Accent'), findsOneWidget);
      expect(find.text('Success'), findsOneWidget);
      expect(find.text('Critical'), findsOneWidget);
    });

    testWidgets('Кнопка с разными размерами отображается', (WidgetTester tester) async {
      final themeProvider = AppThemeProvider();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiButton(
                  text: 'Маленькая',
                  themeProvider: themeProvider,
                  size: UiButtonSize.s,
                  onPressed: () {},
                ),
                const SizedBox(height: 16),
                UiButton(
                  text: 'Средняя',
                  themeProvider: themeProvider,
                  size: UiButtonSize.m,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Проверяем, что обе кнопки отображаются
      expect(find.text('Маленькая'), findsOneWidget);
      expect(find.text('Средняя'), findsOneWidget);
    });
  });
}

