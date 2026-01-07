import 'package:flutter/cupertino.dart';
import 'core/theme/app_theme.dart';
import 'ui/pages/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppThemeProvider _themeProvider = AppThemeProvider();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _themeProvider,
      builder: (context, _) {
        return CupertinoApp(
          theme: CupertinoThemeData(
            brightness: _themeProvider.brightness,
            scaffoldBackgroundColor: _themeProvider.backgroundColor,
            primaryColor: _themeProvider.textPrimary,
          ),
          home: HomePage(themeProvider: _themeProvider),
        );
      },
    );
  }
}
