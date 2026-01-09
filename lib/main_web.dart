import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/theme/app_theme.dart';
import 'ui_web/app_web.dart';

void main() {
  runApp(const WebApp());
}

class WebApp extends StatefulWidget {
  const WebApp({super.key});

  @override
  State<WebApp> createState() => _WebAppState();
}

class _WebAppState extends State<WebApp> {
  final AppThemeProvider _themeProvider = AppThemeProvider();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _themeProvider,
      builder: (context, _) {
        final brightness = _themeProvider.brightness;
        final colorScheme = ColorScheme.fromSeed(
          seedColor: const Color(0xFF454DE7),
          brightness: brightness,
        );

        // Используем Google Fonts для веба - это гарантированно работает
        final textTheme = GoogleFonts.robotoTextTheme();
        
        return MaterialApp(
          title: 'Design Tokens & Components',
          theme: ThemeData(
            brightness: brightness,
            scaffoldBackgroundColor: _themeProvider.backgroundColor,
            colorScheme: colorScheme,
            useMaterial3: true,
            // Явно указываем, что используем Google Fonts, а не локальные шрифты
            fontFamily: GoogleFonts.roboto().fontFamily,
            textTheme: textTheme.apply(
              bodyColor: _themeProvider.textPrimary,
              displayColor: _themeProvider.textPrimary,
            ),
          ),
          home: AppWeb(themeProvider: _themeProvider),
        );
      },
    );
  }
}

