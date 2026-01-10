import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:uikit_ai_sandbox/core/theme/app_theme.dart';
import 'package:uikit_ai_sandbox/ui/widgets/ui_button.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await loadAppFonts();
    
    final fontLoader = FontLoader('RobotoLocal')
      ..addFont(rootBundle.load('lib/fonts/Roboto-Regular.ttf'))
      ..addFont(rootBundle.load('lib/fonts/Roboto-Medium.ttf'))
      ..addFont(rootBundle.load('lib/fonts/Roboto-Bold.ttf'));
    
    await fontLoader.load();
  });

  group('UiButton Golden Tests', () {
    testWidgets('Кнопка с типом accent, стилем main, размером m', 
        (WidgetTester tester) async {
      await tester.pumpWidget(
        CupertinoApp(
          theme: const CupertinoThemeData(
            brightness: Brightness.light,
          ),
          home: CupertinoPageScaffold(
            backgroundColor: CupertinoColors.white,
            child: Center(
              child: UiButton(
                text: 'Кнопка',
                type: UiButtonType.accent,
                style: UiButtonStyle.main,
                size: UiButtonSize.m,
                onPressed: () {},
              ),
            ),
          ),
        ),
      );
      
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      await expectLater(
        find.byType(UiButton),
        matchesGoldenFile('goldens/ui_button_accent_main_m.png'),
      );
    });

    testWidgets('Кнопка с типом accent, стилем minor, размером m', 
        (WidgetTester tester) async {
      await tester.pumpWidget(
        CupertinoApp(
          theme: const CupertinoThemeData(
            brightness: Brightness.light,
          ),
          home: CupertinoPageScaffold(
            backgroundColor: CupertinoColors.white,
            child: Center(
              child: UiButton(
                text: 'Кнопка',
                type: UiButtonType.accent,
                style: UiButtonStyle.minor,
                size: UiButtonSize.m,
                onPressed: () {},
              ),
            ),
          ),
        ),
      );
      
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      await expectLater(
        find.byType(UiButton),
        matchesGoldenFile('goldens/ui_button_accent_minor_m.png'),
      );
    });

    testWidgets('Кнопка с типом neutral, стилем main, размером m', 
        (WidgetTester tester) async {
      await tester.pumpWidget(
        CupertinoApp(
          theme: const CupertinoThemeData(
            brightness: Brightness.light,
          ),
          home: CupertinoPageScaffold(
            backgroundColor: CupertinoColors.white,
            child: Center(
              child: UiButton(
                text: 'Кнопка',
                type: UiButtonType.neutral,
                style: UiButtonStyle.main,
                size: UiButtonSize.m,
                onPressed: () {},
              ),
            ),
          ),
        ),
      );
      
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      await expectLater(
        find.byType(UiButton),
        matchesGoldenFile('goldens/ui_button_neutral_main_m.png'),
      );
    });

    testWidgets('Кнопка с типом success, стилем main, размером m', 
        (WidgetTester tester) async {
      await tester.pumpWidget(
        CupertinoApp(
          theme: const CupertinoThemeData(
            brightness: Brightness.light,
          ),
          home: CupertinoPageScaffold(
            backgroundColor: CupertinoColors.white,
            child: Center(
              child: UiButton(
                text: 'Кнопка',
                type: UiButtonType.success,
                style: UiButtonStyle.main,
                size: UiButtonSize.m,
                onPressed: () {},
              ),
            ),
          ),
        ),
      );
      
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      await expectLater(
        find.byType(UiButton),
        matchesGoldenFile('goldens/ui_button_success_main_m.png'),
      );
    });

    testWidgets('Кнопка с типом critical, стилем main, размером m', 
        (WidgetTester tester) async {
      await tester.pumpWidget(
        CupertinoApp(
          theme: const CupertinoThemeData(
            brightness: Brightness.light,
          ),
          home: CupertinoPageScaffold(
            backgroundColor: CupertinoColors.white,
            child: Center(
              child: UiButton(
                text: 'Кнопка',
                type: UiButtonType.critical,
                style: UiButtonStyle.main,
                size: UiButtonSize.m,
                onPressed: () {},
              ),
            ),
          ),
        ),
      );
      
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      await expectLater(
        find.byType(UiButton),
        matchesGoldenFile('goldens/ui_button_critical_main_m.png'),
      );
    });

    testWidgets('Кнопка с размером s', (WidgetTester tester) async {
      await tester.pumpWidget(
        CupertinoApp(
          theme: const CupertinoThemeData(
            brightness: Brightness.light,
          ),
          home: CupertinoPageScaffold(
            backgroundColor: CupertinoColors.white,
            child: Center(
              child: UiButton(
                text: 'Кнопка',
                type: UiButtonType.accent,
                style: UiButtonStyle.main,
                size: UiButtonSize.s,
                onPressed: () {},
              ),
            ),
          ),
        ),
      );
      
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      await expectLater(
        find.byType(UiButton),
        matchesGoldenFile('goldens/ui_button_accent_main_s.png'),
      );
    });

    testWidgets('Кнопка в состоянии disabled', (WidgetTester tester) async {
      await tester.pumpWidget(
        CupertinoApp(
          theme: const CupertinoThemeData(
            brightness: Brightness.light,
          ),
          home: CupertinoPageScaffold(
            backgroundColor: CupertinoColors.white,
            child: Center(
              child: const UiButton(
                text: 'Кнопка',
                type: UiButtonType.accent,
                style: UiButtonStyle.main,
                size: UiButtonSize.m,
                state: UiButtonState.disabled,
              ),
            ),
          ),
        ),
      );
      
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      await expectLater(
        find.byType(UiButton),
        matchesGoldenFile('goldens/ui_button_disabled.png'),
      );
    });

    testWidgets('Кнопка в состоянии hover', (WidgetTester tester) async {
      await tester.pumpWidget(
        CupertinoApp(
          theme: const CupertinoThemeData(
            brightness: Brightness.light,
          ),
          home: CupertinoPageScaffold(
            backgroundColor: CupertinoColors.white,
            child: Center(
              child: UiButton(
                text: 'Кнопка',
                type: UiButtonType.accent,
                style: UiButtonStyle.main,
                size: UiButtonSize.m,
                state: UiButtonState.hover,
                onPressed: () {},
              ),
            ),
          ),
        ),
      );
      
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      await expectLater(
        find.byType(UiButton),
        matchesGoldenFile('goldens/ui_button_hover.png'),
      );
    });

    testWidgets('Кнопка с иконкой слева', (WidgetTester tester) async {
      await tester.pumpWidget(
        CupertinoApp(
          theme: const CupertinoThemeData(
            brightness: Brightness.light,
          ),
          home: CupertinoPageScaffold(
            backgroundColor: CupertinoColors.white,
            child: Center(
              child: UiButton(
                text: 'Кнопка',
                leftIcon: CupertinoIcons.add,
                type: UiButtonType.accent,
                style: UiButtonStyle.main,
                size: UiButtonSize.m,
                onPressed: () {},
              ),
            ),
          ),
        ),
      );
      
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      await expectLater(
        find.byType(UiButton),
        matchesGoldenFile('goldens/ui_button_with_left_icon.png'),
      );
    });

    testWidgets('Кнопка с иконкой справа', (WidgetTester tester) async {
      await tester.pumpWidget(
        CupertinoApp(
          theme: const CupertinoThemeData(
            brightness: Brightness.light,
          ),
          home: CupertinoPageScaffold(
            backgroundColor: CupertinoColors.white,
            child: Center(
              child: UiButton(
                text: 'Кнопка',
                rightIcon: CupertinoIcons.arrow_right,
                type: UiButtonType.accent,
                style: UiButtonStyle.main,
                size: UiButtonSize.m,
                onPressed: () {},
              ),
            ),
          ),
        ),
      );
      
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      await expectLater(
        find.byType(UiButton),
        matchesGoldenFile('goldens/ui_button_with_right_icon.png'),
      );
    });

    testWidgets('Кнопка только с иконкой (круглая)', (WidgetTester tester) async {
      await tester.pumpWidget(
        CupertinoApp(
          theme: const CupertinoThemeData(
            brightness: Brightness.light,
          ),
          home: CupertinoPageScaffold(
            backgroundColor: CupertinoColors.white,
            child: Center(
              child: UiButton(
                leftIcon: CupertinoIcons.add,
                type: UiButtonType.accent,
                style: UiButtonStyle.main,
                size: UiButtonSize.m,
                role: UiButtonRole.circle,
                onPressed: () {},
              ),
            ),
          ),
        ),
      );
      
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      await expectLater(
        find.byType(UiButton),
        matchesGoldenFile('goldens/ui_button_icon_only_circle.png'),
      );
    });

    testWidgets('Кнопка с формой squircle', (WidgetTester tester) async {
      await tester.pumpWidget(
        CupertinoApp(
          theme: const CupertinoThemeData(
            brightness: Brightness.light,
          ),
          home: CupertinoPageScaffold(
            backgroundColor: CupertinoColors.white,
            child: Center(
              child: UiButton(
                text: 'Кнопка',
                type: UiButtonType.accent,
                style: UiButtonStyle.main,
                size: UiButtonSize.m,
                role: UiButtonRole.squircle,
                onPressed: () {},
              ),
            ),
          ),
        ),
      );
      
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      await expectLater(
        find.byType(UiButton),
        matchesGoldenFile('goldens/ui_button_squircle.png'),
      );
    });

    testWidgets('Все варианты кнопок - светлая тема', (WidgetTester tester) async {
      final themeProvider = AppThemeProvider();
      
      await tester.pumpWidget(
        CupertinoApp(
          theme: CupertinoThemeData(
            brightness: themeProvider.brightness,
          ),
          home: CupertinoPageScaffold(
            backgroundColor: themeProvider.backgroundColor,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UiButton(
                    text: 'Accent Main',
                    type: UiButtonType.accent,
                    style: UiButtonStyle.main,
                    size: UiButtonSize.m,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 16),
                  UiButton(
                    text: 'Accent Minor',
                    type: UiButtonType.accent,
                    style: UiButtonStyle.minor,
                    size: UiButtonSize.m,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 16),
                  UiButton(
                    text: 'Neutral Main',
                    type: UiButtonType.neutral,
                    style: UiButtonStyle.main,
                    size: UiButtonSize.m,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 16),
                  UiButton(
                    text: 'Success Main',
                    type: UiButtonType.success,
                    style: UiButtonStyle.main,
                    size: UiButtonSize.m,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 16),
                  UiButton(
                    text: 'Critical Main',
                    type: UiButtonType.critical,
                    style: UiButtonStyle.main,
                    size: UiButtonSize.m,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      await expectLater(
        find.byType(CupertinoPageScaffold),
        matchesGoldenFile('goldens/ui_button_all_variants_light.png'),
      );
    });

    testWidgets('Все варианты кнопок - темная тема', (WidgetTester tester) async {
      final themeProvider = AppThemeProvider()..setDarkTheme();
      
      await tester.pumpWidget(
        CupertinoApp(
          theme: CupertinoThemeData(
            brightness: themeProvider.brightness,
          ),
          home: CupertinoPageScaffold(
            backgroundColor: themeProvider.backgroundColor,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UiButton(
                    text: 'Accent Main',
                    type: UiButtonType.accent,
                    style: UiButtonStyle.main,
                    size: UiButtonSize.m,
                    themeProvider: themeProvider,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 16),
                  UiButton(
                    text: 'Accent Minor',
                    type: UiButtonType.accent,
                    style: UiButtonStyle.minor,
                    size: UiButtonSize.m,
                    themeProvider: themeProvider,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 16),
                  UiButton(
                    text: 'Neutral Main',
                    type: UiButtonType.neutral,
                    style: UiButtonStyle.main,
                    size: UiButtonSize.m,
                    themeProvider: themeProvider,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 16),
                  UiButton(
                    text: 'Success Main',
                    type: UiButtonType.success,
                    style: UiButtonStyle.main,
                    size: UiButtonSize.m,
                    themeProvider: themeProvider,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 16),
                  UiButton(
                    text: 'Critical Main',
                    type: UiButtonType.critical,
                    style: UiButtonStyle.main,
                    size: UiButtonSize.m,
                    themeProvider: themeProvider,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 16),
                  UiButton(
                    text: 'Disabled',
                    type: UiButtonType.neutral,
                    style: UiButtonStyle.main,
                    size: UiButtonSize.m,
                    state: UiButtonState.disabled,
                    themeProvider: themeProvider,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      await expectLater(
        find.byType(CupertinoPageScaffold),
        matchesGoldenFile('goldens/ui_button_all_variants_dark.png'),
      );
    });

    testWidgets('Кнопки разных размеров', (WidgetTester tester) async {
      await tester.pumpWidget(
        CupertinoApp(
          theme: const CupertinoThemeData(
            brightness: Brightness.light,
          ),
          home: CupertinoPageScaffold(
            backgroundColor: CupertinoColors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UiButton(
                    text: 'Размер M',
                    type: UiButtonType.accent,
                    style: UiButtonStyle.main,
                    size: UiButtonSize.m,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 16),
                  UiButton(
                    text: 'Размер S',
                    type: UiButtonType.accent,
                    style: UiButtonStyle.main,
                    size: UiButtonSize.s,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      await expectLater(
        find.byType(CupertinoPageScaffold),
        matchesGoldenFile('goldens/ui_button_sizes.png'),
      );
    });
  });
}
