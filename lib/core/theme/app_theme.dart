import 'package:flutter/cupertino.dart';
import 'app_theme_tokens.dart';
import 'app_colors.dart';

/// Провайдер темы приложения
class AppThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  Brightness get brightness => _isDarkMode ? Brightness.dark : Brightness.light;

  /// Переключение темы
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  /// Установка светлой темы
  void setLightTheme() {
    if (_isDarkMode) {
      _isDarkMode = false;
      notifyListeners();
    }
  }

  /// Установка темной темы
  void setDarkTheme() {
    if (!_isDarkMode) {
      _isDarkMode = true;
      notifyListeners();
    }
  }

  /// Получить цвет текста primary
  Color get textPrimary => _isDarkMode 
      ? AppThemeDarkTokens.textPrimary 
      : AppThemeLightTokens.textPrimary;

  /// Получить цвет текста secondary
  Color get textSecondary => _isDarkMode 
      ? AppThemeDarkTokens.textSecondary 
      : AppThemeLightTokens.textSecondary;

  /// Получить цвет фона
  Color get backgroundColor => _isDarkMode 
      ? AppColors.blackMain 
      : AppColors.whiteMain;

  /// Получить цвет границы primary
  Color get borderPrimary => _isDarkMode 
      ? AppThemeDarkTokens.borderPrimary 
      : AppThemeLightTokens.borderPrimary;
}

