import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uikit_ai_sandbox/core/theme/app_colors.dart';
import 'package:uikit_ai_sandbox/core/theme/app_spacing.dart';
import 'package:uikit_ai_sandbox/core/theme/app_theme.dart';
import 'package:uikit_ai_sandbox/ui/widgets/ui_button.dart';

void main() {
  group('UiButton Unit Tests', () {
    group('Валидация параметров', () {
      test('Кнопка должна содержать текст или хотя бы одну иконку', () {
        expect(
          () => UiButton(),
          throwsAssertionError,
          reason: 'Кнопка без текста и иконок должна выбрасывать ошибку',
        );
      });

      test('Кнопка с текстом должна создаваться успешно', () {
        expect(
          () => const UiButton(text: 'Текст'),
          returnsNormally,
          reason: 'Кнопка с текстом должна создаваться без ошибок',
        );
      });

      test('Кнопка с leftIcon должна создаваться успешно', () {
        expect(
          () => const UiButton(leftIcon: CupertinoIcons.add),
          returnsNormally,
          reason: 'Кнопка с leftIcon должна создаваться без ошибок',
        );
      });

      test('Кнопка с rightIcon должна создаваться успешно', () {
        expect(
          () => const UiButton(rightIcon: CupertinoIcons.arrow_right),
          returnsNormally,
          reason: 'Кнопка с rightIcon должна создаваться без ошибок',
        );
      });

      test('Кнопка с текстом и иконками должна создаваться успешно', () {
        expect(
          () => const UiButton(
            text: 'Текст',
            leftIcon: CupertinoIcons.add,
            rightIcon: CupertinoIcons.arrow_right,
          ),
          returnsNormally,
          reason: 'Кнопка с текстом и иконками должна создаваться без ошибок',
        );
      });
    });

    group('Логика определения disabled состояния', () {
      testWidgets('Кнопка с state.disabled должна быть disabled', (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: CupertinoPageScaffold(
              child: UiButton(
                text: 'Test',
                state: UiButtonState.disabled,
                onPressed: () {},
              ),
            ),
          ),
        );

        final cupertinoButton = tester.widget<CupertinoButton>(find.byType(CupertinoButton));
        expect(cupertinoButton.onPressed, isNull, reason: 'Кнопка с state.disabled должна быть disabled');
      });

      testWidgets('Кнопка с onPressed == null должна быть disabled', (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: CupertinoPageScaffold(
              child: const UiButton(
                text: 'Test',
                state: UiButtonState.defaultState,
              ),
            ),
          ),
        );

        final cupertinoButton = tester.widget<CupertinoButton>(find.byType(CupertinoButton));
        expect(cupertinoButton.onPressed, isNull, reason: 'Кнопка с onPressed == null должна быть disabled');
      });

      testWidgets('Кнопка с onPressed != null и state.defaultState должна быть enabled', (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: CupertinoPageScaffold(
              child: UiButton(
                text: 'Test',
                state: UiButtonState.defaultState,
                onPressed: () {},
              ),
            ),
          ),
        );

        final cupertinoButton = tester.widget<CupertinoButton>(find.byType(CupertinoButton));
        expect(cupertinoButton.onPressed, isNotNull, reason: 'Кнопка с onPressed != null должна быть enabled');
      });
    });

    group('Цвета кнопок - Accent тип', () {
      testWidgets('Accent main кнопка должна иметь синий фон', (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: CupertinoPageScaffold(
              child: UiButton(
                text: 'Accent',
                type: UiButtonType.accent,
                style: UiButtonStyle.main,
                onPressed: () {},
              ),
            ),
          ),
        );

        final container = tester.widget<Container>(find.descendant(
          of: find.byType(CupertinoButton),
          matching: find.byType(Container),
        ));

        final decoration = container.decoration as BoxDecoration;
        expect(decoration.color, AppColors.blueMain, reason: 'Accent main кнопка должна иметь синий фон');
      });

      testWidgets('Accent main кнопка должна иметь белый текст', (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: CupertinoPageScaffold(
              child: UiButton(
                text: 'Accent',
                type: UiButtonType.accent,
                style: UiButtonStyle.main,
                onPressed: () {},
              ),
            ),
          ),
        );

        final textWidget = tester.widget<Text>(find.text('Accent'));
        expect(textWidget.style?.color, AppColors.whiteMain, reason: 'Accent main кнопка должна иметь белый текст');
      });

      testWidgets('Accent minor кнопка должна иметь прозрачный фон', (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: CupertinoPageScaffold(
              child: UiButton(
                text: 'Accent',
                type: UiButtonType.accent,
                style: UiButtonStyle.minor,
                onPressed: () {},
              ),
            ),
          ),
        );

        final container = tester.widget<Container>(find.descendant(
          of: find.byType(CupertinoButton),
          matching: find.byType(Container),
        ));

        final decoration = container.decoration as BoxDecoration;
        expect(decoration.color, Colors.transparent, reason: 'Accent minor кнопка должна иметь прозрачный фон');
      });

      testWidgets('Accent minor кнопка должна иметь синий текст', (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: CupertinoPageScaffold(
              child: UiButton(
                text: 'Accent',
                type: UiButtonType.accent,
                style: UiButtonStyle.minor,
                onPressed: () {},
              ),
            ),
          ),
        );

        final textWidget = tester.widget<Text>(find.text('Accent'));
        expect(textWidget.style?.color, AppColors.blueMain, reason: 'Accent minor кнопка должна иметь синий текст');
      });

      testWidgets('Accent minor кнопка должна иметь синюю обводку', (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: CupertinoPageScaffold(
              child: UiButton(
                text: 'Accent',
                type: UiButtonType.accent,
                style: UiButtonStyle.minor,
                onPressed: () {},
              ),
            ),
          ),
        );

        final container = tester.widget<Container>(find.descendant(
          of: find.byType(CupertinoButton),
          matching: find.byType(Container),
        ));

        final decoration = container.decoration as BoxDecoration;
        expect(decoration.border, isNotNull, reason: 'Accent minor кнопка должна иметь обводку');
        expect(decoration.border?.top.color, AppColors.blueMain, reason: 'Accent minor кнопка должна иметь синюю обводку');
      });
    });

    group('Цвета кнопок - Success тип', () {
      testWidgets('Success main кнопка должна иметь зеленый фон', (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: CupertinoPageScaffold(
              child: UiButton(
                text: 'Success',
                type: UiButtonType.success,
                style: UiButtonStyle.main,
                onPressed: () {},
              ),
            ),
          ),
        );

        final container = tester.widget<Container>(find.descendant(
          of: find.byType(CupertinoButton),
          matching: find.byType(Container),
        ));

        final decoration = container.decoration as BoxDecoration;
        expect(decoration.color, AppColors.greenMain, reason: 'Success main кнопка должна иметь зеленый фон');
      });

      testWidgets('Success main кнопка должна иметь белый текст', (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: CupertinoPageScaffold(
              child: UiButton(
                text: 'Success',
                type: UiButtonType.success,
                style: UiButtonStyle.main,
                onPressed: () {},
              ),
            ),
          ),
        );

        final textWidget = tester.widget<Text>(find.text('Success'));
        expect(textWidget.style?.color, AppColors.whiteMain, reason: 'Success main кнопка должна иметь белый текст');
      });
    });

    group('Цвета кнопок - Critical тип', () {
      testWidgets('Critical main кнопка должна иметь красный фон', (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: CupertinoPageScaffold(
              child: UiButton(
                text: 'Critical',
                type: UiButtonType.critical,
                style: UiButtonStyle.main,
                onPressed: () {},
              ),
            ),
          ),
        );

        final container = tester.widget<Container>(find.descendant(
          of: find.byType(CupertinoButton),
          matching: find.byType(Container),
        ));

        final decoration = container.decoration as BoxDecoration;
        expect(decoration.color, AppColors.redMain, reason: 'Critical main кнопка должна иметь красный фон');
      });

      testWidgets('Critical main кнопка должна иметь белый текст', (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: CupertinoPageScaffold(
              child: UiButton(
                text: 'Critical',
                type: UiButtonType.critical,
                style: UiButtonStyle.main,
                onPressed: () {},
              ),
            ),
          ),
        );

        final textWidget = tester.widget<Text>(find.text('Critical'));
        expect(textWidget.style?.color, AppColors.whiteMain, reason: 'Critical main кнопка должна иметь белый текст');
      });
    });

    group('Цвета кнопок - Neutral тип', () {
      testWidgets('Neutral main кнопка в светлой теме должна иметь серый фон', (tester) async {
        final lightThemeProvider = AppThemeProvider();

        await tester.pumpWidget(
          CupertinoApp(
            theme: CupertinoThemeData(brightness: lightThemeProvider.brightness),
            home: CupertinoPageScaffold(
              child: UiButton(
                text: 'Neutral',
                type: UiButtonType.neutral,
                style: UiButtonStyle.main,
                themeProvider: lightThemeProvider,
                onPressed: () {},
              ),
            ),
          ),
        );

        final container = tester.widget<Container>(find.descendant(
          of: find.byType(CupertinoButton),
          matching: find.byType(Container),
        ));

        final decoration = container.decoration as BoxDecoration;
        expect(decoration.color, AppColors.black300, reason: 'Neutral main кнопка в светлой теме должна иметь серый фон');
      });

      testWidgets('Neutral main кнопка в темной теме должна иметь светлый фон', (tester) async {
        final darkThemeProvider = AppThemeProvider()..setDarkTheme();

        await tester.pumpWidget(
          CupertinoApp(
            theme: CupertinoThemeData(brightness: darkThemeProvider.brightness),
            home: CupertinoPageScaffold(
              child: UiButton(
                text: 'Neutral',
                type: UiButtonType.neutral,
                style: UiButtonStyle.main,
                themeProvider: darkThemeProvider,
                onPressed: () {},
              ),
            ),
          ),
        );

        final container = tester.widget<Container>(find.descendant(
          of: find.byType(CupertinoButton),
          matching: find.byType(Container),
        ));

        final decoration = container.decoration as BoxDecoration;
        expect(decoration.color, AppColors.white300, reason: 'Neutral main кнопка в темной теме должна иметь светлый фон');
      });

      testWidgets('Neutral main кнопка в светлой теме должна иметь черный текст', (tester) async {
        final lightThemeProvider = AppThemeProvider();

        await tester.pumpWidget(
          CupertinoApp(
            theme: CupertinoThemeData(brightness: lightThemeProvider.brightness),
            home: CupertinoPageScaffold(
              child: UiButton(
                text: 'Neutral',
                type: UiButtonType.neutral,
                style: UiButtonStyle.main,
                themeProvider: lightThemeProvider,
                onPressed: () {},
              ),
            ),
          ),
        );

        final textWidget = tester.widget<Text>(find.text('Neutral'));
        expect(textWidget.style?.color, AppColors.blackMain, reason: 'Neutral main кнопка в светлой теме должна иметь черный текст');
      });

      testWidgets('Neutral main кнопка в темной теме должна иметь белый текст', (tester) async {
        final darkThemeProvider = AppThemeProvider()..setDarkTheme();

        await tester.pumpWidget(
          CupertinoApp(
            theme: CupertinoThemeData(brightness: darkThemeProvider.brightness),
            home: CupertinoPageScaffold(
              child: UiButton(
                text: 'Neutral',
                type: UiButtonType.neutral,
                style: UiButtonStyle.main,
                themeProvider: darkThemeProvider,
                onPressed: () {},
              ),
            ),
          ),
        );

        final textWidget = tester.widget<Text>(find.text('Neutral'));
        expect(textWidget.style?.color, AppColors.whiteMain, reason: 'Neutral main кнопка в темной теме должна иметь белый текст');
      });
    });

    group('Цвета кнопок - Disabled состояние', () {
      testWidgets('Disabled кнопка в светлой теме должна иметь серый фон', (tester) async {
        final lightThemeProvider = AppThemeProvider();

        await tester.pumpWidget(
          CupertinoApp(
            theme: CupertinoThemeData(brightness: lightThemeProvider.brightness),
            home: CupertinoPageScaffold(
              child: UiButton(
                text: 'Disabled',
                type: UiButtonType.accent,
                style: UiButtonStyle.main,
                state: UiButtonState.disabled,
                themeProvider: lightThemeProvider,
                onPressed: () {},
              ),
            ),
          ),
        );

        final container = tester.widget<Container>(find.descendant(
          of: find.byType(CupertinoButton),
          matching: find.byType(Container),
        ));

        final decoration = container.decoration as BoxDecoration;
        expect(decoration.color, AppColors.black300, reason: 'Disabled кнопка в светлой теме должна иметь серый фон');
      });

      testWidgets('Disabled кнопка в темной теме должна иметь светлый фон', (tester) async {
        final darkThemeProvider = AppThemeProvider()..setDarkTheme();

        await tester.pumpWidget(
          CupertinoApp(
            theme: CupertinoThemeData(brightness: darkThemeProvider.brightness),
            home: CupertinoPageScaffold(
              child: UiButton(
                text: 'Disabled',
                type: UiButtonType.accent,
                style: UiButtonStyle.main,
                state: UiButtonState.disabled,
                themeProvider: darkThemeProvider,
                onPressed: () {},
              ),
            ),
          ),
        );

        final container = tester.widget<Container>(find.descendant(
          of: find.byType(CupertinoButton),
          matching: find.byType(Container),
        ));

        final decoration = container.decoration as BoxDecoration;
        expect(decoration.color, AppColors.white300, reason: 'Disabled кнопка в темной теме должна иметь светлый фон');
      });

      testWidgets('Disabled кнопка в светлой теме должна иметь серый текст', (tester) async {
        final lightThemeProvider = AppThemeProvider();

        await tester.pumpWidget(
          CupertinoApp(
            theme: CupertinoThemeData(brightness: lightThemeProvider.brightness),
            home: CupertinoPageScaffold(
              child: UiButton(
                text: 'Disabled',
                type: UiButtonType.accent,
                style: UiButtonStyle.main,
                state: UiButtonState.disabled,
                themeProvider: lightThemeProvider,
                onPressed: () {},
              ),
            ),
          ),
        );

        final textWidget = tester.widget<Text>(find.text('Disabled'));
        expect(textWidget.style?.color, AppColors.black400, reason: 'Disabled кнопка в светлой теме должна иметь серый текст');
      });

      testWidgets('Disabled minor кнопка должна иметь прозрачный фон', (tester) async {
        final lightThemeProvider = AppThemeProvider();

        await tester.pumpWidget(
          CupertinoApp(
            theme: CupertinoThemeData(brightness: lightThemeProvider.brightness),
            home: CupertinoPageScaffold(
              child: UiButton(
                text: 'Disabled',
                type: UiButtonType.accent,
                style: UiButtonStyle.minor,
                state: UiButtonState.disabled,
                themeProvider: lightThemeProvider,
                onPressed: () {},
              ),
            ),
          ),
        );

        final container = tester.widget<Container>(find.descendant(
          of: find.byType(CupertinoButton),
          matching: find.byType(Container),
        ));

        final decoration = container.decoration as BoxDecoration;
        expect(decoration.color?.value, Colors.transparent.value, reason: 'Disabled minor кнопка должна иметь прозрачный фон');
      });
    });

    group('Hover состояние', () {
      testWidgets('Hover кнопка должна иметь затемненный фон', (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: CupertinoPageScaffold(
              child: UiButton(
                text: 'Hover',
                type: UiButtonType.accent,
                style: UiButtonStyle.main,
                state: UiButtonState.hover,
                onPressed: () {},
              ),
            ),
          ),
        );

        final container = tester.widget<Container>(find.descendant(
          of: find.byType(CupertinoButton),
          matching: find.byType(Container),
        ));

        final decoration = container.decoration as BoxDecoration;
        final hoverColor = Color.lerp(AppColors.blueMain, AppColors.blackMain, 0.1)!;
        
        // Проверяем, что цвет отличается от обычного (должен быть затемнен)
        expect(decoration.color, isNot(AppColors.blueMain), reason: 'Hover кнопка должна иметь затемненный фон');
        expect(decoration.color, hoverColor, reason: 'Hover кнопка должна иметь правильный затемненный цвет');
      });

      testWidgets('Hover minor кнопка не должна иметь затемненный фон', (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: CupertinoPageScaffold(
              child: UiButton(
                text: 'Hover',
                type: UiButtonType.accent,
                style: UiButtonStyle.minor,
                state: UiButtonState.hover,
                onPressed: () {},
              ),
            ),
          ),
        );

        final container = tester.widget<Container>(find.descendant(
          of: find.byType(CupertinoButton),
          matching: find.byType(Container),
        ));

        final decoration = container.decoration as BoxDecoration;
        expect(decoration.color, isA<Color>(), reason: 'Hover minor кнопка не должна иметь затемненный фон');
        expect(decoration.color?.value, Colors.transparent.value, reason: 'Hover minor кнопка должна иметь прозрачный фон');
      });
    });

    group('Отступы (Padding)', () {
      testWidgets('Кнопка размера m должна иметь правильные отступы', (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: CupertinoPageScaffold(
              child: UiButton(
                text: 'Medium',
                size: UiButtonSize.m,
                onPressed: () {},
              ),
            ),
          ),
        );

        final paddingWidgets = find.descendant(
          of: find.byType(CupertinoButton),
          matching: find.byType(Padding),
        );
        
        expect(paddingWidgets, findsWidgets, reason: 'Должен быть виджет Padding');
        
        // Берем последний Padding виджет (который содержит основной контент кнопки)
        final allPaddings = tester.widgetList<Padding>(paddingWidgets);
        final padding = allPaddings.last;

        expect(
          padding.padding,
          const EdgeInsets.symmetric(
            horizontal: AppSpacing.spacing16,
            vertical: AppSpacing.spacing12,
          ),
          reason: 'Кнопка размера m должна иметь правильные отступы',
        );
      });

      testWidgets('Кнопка размера s должна иметь правильные отступы', (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: CupertinoPageScaffold(
              child: UiButton(
                text: 'Small',
                size: UiButtonSize.s,
                onPressed: () {},
              ),
            ),
          ),
        );

        final paddingWidgets = find.descendant(
          of: find.byType(CupertinoButton),
          matching: find.byType(Padding),
        );
        
        expect(paddingWidgets, findsWidgets, reason: 'Должен быть виджет Padding');
        
        // Берем последний Padding виджет (который содержит основной контент кнопки)
        final allPaddings = tester.widgetList<Padding>(paddingWidgets);
        final padding = allPaddings.last;

        expect(
          padding.padding,
          const EdgeInsets.symmetric(
            horizontal: AppSpacing.spacing12,
            vertical: AppSpacing.spacing8,
          ),
          reason: 'Кнопка размера s должна иметь правильные отступы',
        );
      });
    });

    group('Радиус скругления (BorderRadius)', () {
      testWidgets('Кнопка с формой squircle должна иметь радиус 8', (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: CupertinoPageScaffold(
              child: UiButton(
                text: 'Squircle',
                role: UiButtonRole.squircle,
                onPressed: () {},
              ),
            ),
          ),
        );

        final container = tester.widget<Container>(find.descendant(
          of: find.byType(CupertinoButton),
          matching: find.byType(Container),
        ));

        final decoration = container.decoration as BoxDecoration;
        expect(
          decoration.borderRadius,
          BorderRadius.circular(AppSpacing.spacing8),
          reason: 'Кнопка с формой squircle должна иметь радиус 8',
        );
      });

      testWidgets('Кнопка с формой circle должна иметь радиус 999', (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: CupertinoPageScaffold(
              child: UiButton(
                leftIcon: CupertinoIcons.add,
                role: UiButtonRole.circle,
                onPressed: () {},
              ),
            ),
          ),
        );

        final container = tester.widget<Container>(find.descendant(
          of: find.byType(CupertinoButton),
          matching: find.byType(Container),
        ));

        final decoration = container.decoration as BoxDecoration;
        expect(
          decoration.borderRadius,
          BorderRadius.circular(999),
          reason: 'Кнопка с формой circle должна иметь радиус 999',
        );
      });
    });

    group('Размеры иконок', () {
      testWidgets('Кнопка размера m должна иметь иконки размером 24', (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: CupertinoPageScaffold(
              child: UiButton(
                text: 'Test',
                leftIcon: CupertinoIcons.add,
                size: UiButtonSize.m,
                onPressed: () {},
              ),
            ),
          ),
        );

        final icon = tester.widget<Icon>(find.byIcon(CupertinoIcons.add));
        expect(icon.size, 24.0, reason: 'Кнопка размера m должна иметь иконки размером 24');
      });

      testWidgets('Кнопка размера s должна иметь иконки размером 20', (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: CupertinoPageScaffold(
              child: UiButton(
                text: 'Test',
                leftIcon: CupertinoIcons.add,
                size: UiButtonSize.s,
                onPressed: () {},
              ),
            ),
          ),
        );

        final icon = tester.widget<Icon>(find.byIcon(CupertinoIcons.add));
        expect(icon.size, 20.0, reason: 'Кнопка размера s должна иметь иконки размером 20');
      });
    });

    group('Структура контента', () {
      testWidgets('Кнопка с текстом должна отображать текст', (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: CupertinoPageScaffold(
              child: UiButton(
                text: 'Test Button',
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.text('Test Button'), findsOneWidget, reason: 'Кнопка с текстом должна отображать текст');
      });

      testWidgets('Кнопка с leftIcon должна отображать иконку слева', (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: CupertinoPageScaffold(
              child: UiButton(
                text: 'Test',
                leftIcon: CupertinoIcons.add,
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byIcon(CupertinoIcons.add), findsOneWidget, reason: 'Кнопка с leftIcon должна отображать иконку');
        expect(find.text('Test'), findsOneWidget, reason: 'Кнопка с leftIcon должна отображать текст');
      });

      testWidgets('Кнопка с rightIcon должна отображать иконку справа', (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: CupertinoPageScaffold(
              child: UiButton(
                text: 'Test',
                rightIcon: CupertinoIcons.arrow_right,
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byIcon(CupertinoIcons.arrow_right), findsOneWidget, reason: 'Кнопка с rightIcon должна отображать иконку');
        expect(find.text('Test'), findsOneWidget, reason: 'Кнопка с rightIcon должна отображать текст');
      });

      testWidgets('Кнопка только с иконкой должна иметь правильную структуру', (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: CupertinoPageScaffold(
              child: UiButton(
                leftIcon: CupertinoIcons.add,
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byIcon(CupertinoIcons.add), findsOneWidget, reason: 'Кнопка только с иконкой должна отображать иконку');
        expect(find.byType(Row), findsNothing, reason: 'Кнопка только с иконкой не должна содержать Row');
      });

      testWidgets('Кнопка с текстом и иконками должна иметь Row структуру', (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: CupertinoPageScaffold(
              child: UiButton(
                text: 'Test',
                leftIcon: CupertinoIcons.add,
                rightIcon: CupertinoIcons.arrow_right,
                onPressed: () {},
              ),
            ),
          ),
        );

        expect(find.byType(Row), findsOneWidget, reason: 'Кнопка с текстом и иконками должна содержать Row');
        expect(find.text('Test'), findsOneWidget, reason: 'Кнопка должна отображать текст');
        expect(find.byIcon(CupertinoIcons.add), findsOneWidget, reason: 'Кнопка должна отображать leftIcon');
        expect(find.byIcon(CupertinoIcons.arrow_right), findsOneWidget, reason: 'Кнопка должна отображать rightIcon');
      });
    });

    group('Цвета иконок', () {
      testWidgets('Иконки должны иметь правильный цвет текста кнопки', (tester) async {
        await tester.pumpWidget(
          CupertinoApp(
            home: CupertinoPageScaffold(
              child: UiButton(
                text: 'Test',
                leftIcon: CupertinoIcons.add,
                type: UiButtonType.accent,
                style: UiButtonStyle.main,
                onPressed: () {},
              ),
            ),
          ),
        );

        final icon = tester.widget<Icon>(find.byIcon(CupertinoIcons.add));
        final textWidget = tester.widget<Text>(find.text('Test'));
        
        expect(icon.color, textWidget.style?.color, reason: 'Иконки должны иметь тот же цвет, что и текст кнопки');
        expect(icon.color, AppColors.whiteMain, reason: 'Иконки в accent main кнопке должны быть белыми');
      });
    });

    group('Дефолтные значения', () {
      test('Кнопка должна иметь дефолтные значения параметров', () {
        const button = UiButton(text: 'Test');
        
        expect(button.state, UiButtonState.defaultState, reason: 'Дефолтное состояние должно быть defaultState');
        expect(button.style, UiButtonStyle.main, reason: 'Дефолтный стиль должен быть main');
        expect(button.type, UiButtonType.accent, reason: 'Дефолтный тип должен быть accent');
        expect(button.size, UiButtonSize.m, reason: 'Дефолтный размер должен быть m');
        expect(button.role, UiButtonRole.squircle, reason: 'Дефолтная форма должна быть squircle');
      });
    });
  });
}

