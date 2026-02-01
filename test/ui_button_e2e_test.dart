import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uikit_ai_sandbox/core/theme/app_theme.dart';
import 'package:uikit_ai_sandbox/ui/widgets/ui_button.dart';

void main() {
  group('UiButton E2E тесты (поддерживают веб)', () {
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

      // Находим кнопку и проверяем, что она нажимаема
      final buttonFinder = find.text('Тестовая кнопка');
      expect(buttonFinder, findsOneWidget);
      
      // Нажимаем на кнопку
      await tester.tap(buttonFinder);
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
      final buttonFinder = find.text('Отключенная кнопка');
      expect(buttonFinder, findsOneWidget);
      
      // Пытаемся нажать (должно быть проигнорировано)
      await tester.tap(buttonFinder, warnIfMissed: false);
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

      // Проверяем, что иконки отображаются
      expect(find.byIcon(Icons.favorite), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
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

    testWidgets('Кнопка с разными стилями отображается', (WidgetTester tester) async {
      final themeProvider = AppThemeProvider();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiButton(
                  text: 'Main',
                  themeProvider: themeProvider,
                  style: UiButtonStyle.main,
                  onPressed: () {},
                ),
                const SizedBox(height: 16),
                UiButton(
                  text: 'Minor',
                  themeProvider: themeProvider,
                  style: UiButtonStyle.minor,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Проверяем, что обе кнопки отображаются
      expect(find.text('Main'), findsOneWidget);
      expect(find.text('Minor'), findsOneWidget);
    });

    testWidgets('Множественные нажатия обрабатываются корректно', (WidgetTester tester) async {
      final themeProvider = AppThemeProvider();
      int pressCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: UiButton(
                text: 'Счетчик',
                themeProvider: themeProvider,
                onPressed: () {
                  pressCount++;
                },
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Нажимаем несколько раз
      for (int i = 0; i < 5; i++) {
        await tester.tap(find.text('Счетчик'));
        await tester.pump();
      }

      await tester.pumpAndSettle();

      // Проверяем, что все нажатия были обработаны
      expect(pressCount, 5);
    });
  });
}

