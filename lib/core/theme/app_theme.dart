import 'package:flutter/cupertino.dart';
import 'app_theme_tokens.dart';

/// Провайдер темы приложения
class AppThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  Brightness get brightness => _isDarkMode ?
    Brightness.dark :
    Brightness.light;

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

  // ============================================
  // Border
  // ============================================

  /// Получить цвет границы primary
  Color get borderPrimary => _isDarkMode 
      ? AppThemeDarkTokens.borderPrimary 
      : AppThemeLightTokens.borderPrimary;

  /// Получить цвет границы secondary
  Color get borderSecondary => _isDarkMode 
      ? AppThemeDarkTokens.borderSecondary 
      : AppThemeLightTokens.borderSecondary;

  // ============================================
  // Text
  // ============================================

  /// Получить цвет текста primary
  Color get textPrimary => _isDarkMode 
      ? AppThemeDarkTokens.textPrimary 
      : AppThemeLightTokens.textPrimary;

  /// Получить цвет текста secondary
  Color get textSecondary => _isDarkMode 
      ? AppThemeDarkTokens.textSecondary 
      : AppThemeLightTokens.textSecondary;

  /// Получить цвет текста disabled
  Color get textDisabled => _isDarkMode 
      ? AppThemeDarkTokens.textDisabled 
      : AppThemeLightTokens.textDisabled;

  /// Получить цвет текста accent
  Color get textAccent => _isDarkMode 
      ? AppThemeDarkTokens.textAccent 
      : AppThemeLightTokens.textAccent;

  /// Получить цвет текста critical
  Color get textCritical => _isDarkMode 
      ? AppThemeDarkTokens.textCritical 
      : AppThemeLightTokens.textCritical;

  /// Получить цвет текста caution
  Color get textCaution => _isDarkMode 
      ? AppThemeDarkTokens.textCaution 
      : AppThemeLightTokens.textCaution;

  /// Получить цвет текста success
  Color get textSuccess => _isDarkMode 
      ? AppThemeDarkTokens.textSuccess 
      : AppThemeLightTokens.textSuccess;

  /// Получить цвет текста primary-inverse
  Color get textPrimaryInverse => _isDarkMode 
      ? AppThemeDarkTokens.textPrimaryInverse 
      : AppThemeLightTokens.textPrimaryInverse;

  /// Получить цвет текста primary-on-color
  Color get textPrimaryOnColor => _isDarkMode 
      ? AppThemeDarkTokens.textPrimaryOnColor 
      : AppThemeLightTokens.textPrimaryOnColor;

  // ============================================
  // Icon
  // ============================================

  /// Получить цвет иконки primary
  Color get iconPrimary => _isDarkMode 
      ? AppThemeDarkTokens.iconPrimary 
      : AppThemeLightTokens.iconPrimary;

  /// Получить цвет иконки secondary
  Color get iconSecondary => _isDarkMode 
      ? AppThemeDarkTokens.iconSecondary 
      : AppThemeLightTokens.iconSecondary;

  /// Получить цвет иконки disabled
  Color get iconDisabled => _isDarkMode 
      ? AppThemeDarkTokens.iconDisabled 
      : AppThemeLightTokens.iconDisabled;

  /// Получить цвет иконки accent
  Color get iconAccent => _isDarkMode 
      ? AppThemeDarkTokens.iconAccent 
      : AppThemeLightTokens.iconAccent;

  /// Получить цвет иконки critical
  Color get iconCritical => _isDarkMode 
      ? AppThemeDarkTokens.iconCritical 
      : AppThemeLightTokens.iconCritical;

  /// Получить цвет иконки caution
  Color get iconCaution => _isDarkMode 
      ? AppThemeDarkTokens.iconCaution 
      : AppThemeLightTokens.iconCaution;

  /// Получить цвет иконки success
  Color get iconSuccess => _isDarkMode 
      ? AppThemeDarkTokens.iconSuccess 
      : AppThemeLightTokens.iconSuccess;

  // ============================================
  // Background (bg)
  // ============================================

  /// Получить цвет фона primary
  Color get bgPrimary => _isDarkMode 
      ? AppThemeDarkTokens.bgPrimary 
      : AppThemeLightTokens.bgPrimary;

  /// Получить цвет фона primary-hover
  Color get bgPrimaryHover => _isDarkMode 
      ? AppThemeDarkTokens.bgPrimaryHover 
      : AppThemeLightTokens.bgPrimaryHover;

  /// Получить цвет фона primary-active
  Color get bgPrimaryActive => _isDarkMode 
      ? AppThemeDarkTokens.bgPrimaryActive 
      : AppThemeLightTokens.bgPrimaryActive;

  /// Получить цвет фона secondary
  Color get bgSecondary => _isDarkMode 
      ? AppThemeDarkTokens.bgSecondary 
      : AppThemeLightTokens.bgSecondary;

  /// Получить цвет фона secondary-hover
  Color get bgSecondaryHover => _isDarkMode 
      ? AppThemeDarkTokens.bgSecondaryHover 
      : AppThemeLightTokens.bgSecondaryHover;

  /// Получить цвет фона secondary-active
  Color get bgSecondaryActive => _isDarkMode 
      ? AppThemeDarkTokens.bgSecondaryActive 
      : AppThemeLightTokens.bgSecondaryActive;

  /// Получить цвет фона accent
  Color get bgAccent => _isDarkMode 
      ? AppThemeDarkTokens.bgAccent 
      : AppThemeLightTokens.bgAccent;

  /// Получить цвет фона accent-hover
  Color get bgAccentHover => _isDarkMode 
      ? AppThemeDarkTokens.bgAccentHover 
      : AppThemeLightTokens.bgAccentHover;

  /// Получить цвет фона accent-active
  Color get bgAccentActive => _isDarkMode 
      ? AppThemeDarkTokens.bgAccentActive 
      : AppThemeLightTokens.bgAccentActive;

  /// Получить цвет фона acccent-subdued (опечатка в JSON сохранена)
  Color get bgAcccentSubdued => _isDarkMode 
      ? AppThemeDarkTokens.bgAcccentSubdued 
      : AppThemeLightTokens.bgAcccentSubdued;

  /// Получить цвет фона accent-subdued-hover
  Color get bgAccentSubduedHover => _isDarkMode 
      ? AppThemeDarkTokens.bgAccentSubduedHover 
      : AppThemeLightTokens.bgAccentSubduedHover;

  /// Получить цвет фона accent-subdued-active
  Color get bgAccentSubduedActive => _isDarkMode 
      ? AppThemeDarkTokens.bgAccentSubduedActive 
      : AppThemeLightTokens.bgAccentSubduedActive;

  /// Получить цвет фона primary-inverse
  Color get bgPrimaryInverse => _isDarkMode 
      ? AppThemeDarkTokens.bgPrimaryInverse 
      : AppThemeLightTokens.bgPrimaryInverse;

  /// Получить цвет фона secondary-inverse
  Color get bgSecondaryInverse => _isDarkMode 
      ? AppThemeDarkTokens.bgSecondaryInverse 
      : AppThemeLightTokens.bgSecondaryInverse;

  /// Получить цвет фона (алиас для bgPrimary)
  Color get backgroundColor => bgPrimary;

  // ============================================
  // Surface
  // ============================================

  /// Получить цвет поверхности default
  Color get surfaceDefault => _isDarkMode 
      ? AppThemeDarkTokens.surfaceDefault 
      : AppThemeLightTokens.surfaceDefault;

  /// Получить цвет поверхности success.main
  Color get surfaceSuccessMain => _isDarkMode 
      ? AppThemeDarkTokens.surfaceSuccessMain 
      : AppThemeLightTokens.surfaceSuccessMain;

  /// Получить цвет поверхности success.hover
  Color get surfaceSuccessHover => _isDarkMode 
      ? AppThemeDarkTokens.surfaceSuccessHover 
      : AppThemeLightTokens.surfaceSuccessHover;

  /// Получить цвет поверхности success.medium
  Color get surfaceSuccessMedium => _isDarkMode 
      ? AppThemeDarkTokens.surfaceSuccessMedium 
      : AppThemeLightTokens.surfaceSuccessMedium;

  /// Получить цвет поверхности success.low
  Color get surfaceSuccessLow => _isDarkMode 
      ? AppThemeDarkTokens.surfaceSuccessLow 
      : AppThemeLightTokens.surfaceSuccessLow;

  /// Получить цвет поверхности neutral.default
  Color get surfaceNeutralDefault => _isDarkMode 
      ? AppThemeDarkTokens.surfaceNeutralDefault 
      : AppThemeLightTokens.surfaceNeutralDefault;

  /// Получить цвет поверхности neutral.low
  Color get surfaceNeutralLow => _isDarkMode 
      ? AppThemeDarkTokens.surfaceNeutralLow 
      : AppThemeLightTokens.surfaceNeutralLow;

  /// Получить цвет поверхности neutral.medium
  Color get surfaceNeutralMedium => _isDarkMode 
      ? AppThemeDarkTokens.surfaceNeutralMedium 
      : AppThemeLightTokens.surfaceNeutralMedium;

  /// Получить цвет поверхности neutral.high
  Color get surfaceNeutralHigh => _isDarkMode 
      ? AppThemeDarkTokens.surfaceNeutralHigh 
      : AppThemeLightTokens.surfaceNeutralHigh;

  /// Получить цвет поверхности accent.main
  Color get surfaceAccentMain => _isDarkMode 
      ? AppThemeDarkTokens.surfaceAccentMain 
      : AppThemeLightTokens.surfaceAccentMain;

  /// Получить цвет поверхности accent.hover
  Color get surfaceAccentHover => _isDarkMode 
      ? AppThemeDarkTokens.surfaceAccentHover 
      : AppThemeLightTokens.surfaceAccentHover;

  /// Получить цвет поверхности accent.medium
  Color get surfaceAccentMedium => _isDarkMode 
      ? AppThemeDarkTokens.surfaceAccentMedium 
      : AppThemeLightTokens.surfaceAccentMedium;

  /// Получить цвет поверхности accent.low
  Color get surfaceAccentLow => _isDarkMode 
      ? AppThemeDarkTokens.surfaceAccentLow 
      : AppThemeLightTokens.surfaceAccentLow;

  /// Получить цвет поверхности critical.main
  Color get surfaceCriticalMain => _isDarkMode 
      ? AppThemeDarkTokens.surfaceCriticalMain 
      : AppThemeLightTokens.surfaceCriticalMain;

  /// Получить цвет поверхности critical.hover
  Color get surfaceCriticalHover => _isDarkMode 
      ? AppThemeDarkTokens.surfaceCriticalHover 
      : AppThemeLightTokens.surfaceCriticalHover;

  /// Получить цвет поверхности critical.medium
  Color get surfaceCriticalMedium => _isDarkMode 
      ? AppThemeDarkTokens.surfaceCriticalMedium 
      : AppThemeLightTokens.surfaceCriticalMedium;

  /// Получить цвет поверхности critical.low
  Color get surfaceCriticalLow => _isDarkMode 
      ? AppThemeDarkTokens.surfaceCriticalLow 
      : AppThemeLightTokens.surfaceCriticalLow;
}

