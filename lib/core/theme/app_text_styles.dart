import 'package:flutter/cupertino.dart';
import 'app_typography.dart';
import 'app_colors.dart';

/// Класс с текстовыми стилями приложения, извлеченными из Figma Typography node (10:292)
class AppTextStyles {
  AppTextStyles._();

  // ============================================
  // Headings - Заголовки
  // ============================================

  /// H1 - Заголовок первого уровня
  /// Font: Roboto, Weight: Bold (700), Size: 30px, Line Height: 32px
  static const TextStyle h1 = TextStyle(
    fontFamily: AppTypography.fontSans,
    fontWeight: AppTypography.weightBold,
    fontSize: AppTypography.size30,
    height: 32.0 / 30.0, // lineHeight / fontSize
    letterSpacing: 0.0,
    color: AppColors.blackMain,
  );

  /// H2 - Заголовок второго уровня
  /// Font: Roboto, Weight: Bold (700), Size: 24px, Line Height: 32px
  static const TextStyle h2 = TextStyle(
    fontFamily: AppTypography.fontSans,
    fontWeight: AppTypography.weightBold,
    fontSize: AppTypography.size24,
    height: 32.0 / 24.0, // lineHeight / fontSize
    letterSpacing: 0.0,
    color: AppColors.blackMain,
  );

  // ============================================
  // Large - Крупный текст
  // ============================================

  /// Large - Крупный текст
  /// Font: Roboto, Weight: Medium (500), Size: 22px, Line Height: 24px
  static const TextStyle large = TextStyle(
    fontFamily: AppTypography.fontSans,
    fontWeight: AppTypography.weightMedium,
    fontSize: AppTypography.size22,
    height: 24.0 / 22.0, // lineHeight / fontSize
    letterSpacing: 0.0,
    color: AppColors.blackMain,
  );

  // ============================================
  // Body - Основной текст
  // ============================================

  /// Body / Regular - Основной текст обычной насыщенности
  /// Font: Roboto, Weight: Regular (400), Size: 18px, Line Height: 24px
  static const TextStyle bodyRegular = TextStyle(
    fontFamily: AppTypography.fontSans,
    fontWeight: AppTypography.weightRegular,
    fontSize: AppTypography.size18,
    height: 24.0 / 18.0, // lineHeight / fontSize
    letterSpacing: 0.0,
    color: AppColors.blackMain,
  );

  /// Body / Monospace - Основной текст моноширинный
  /// Font: Roboto, Weight: Regular (400), Size: 18px, Line Height: 24px
  /// Используется для числовых данных и выравнивания
  static const TextStyle bodyMonospace = TextStyle(
    fontFamily: AppTypography.fontSans,
    fontWeight: AppTypography.weightRegular,
    fontSize: AppTypography.size18,
    height: 24.0 / 18.0, // lineHeight / fontSize
    letterSpacing: 0.0,
    color: AppColors.blackMain,
    // В Flutter моноширинный шрифт задается через fontFeatures
    // или отдельным семейством шрифтов, если доступно
  );

  /// Body / Medium - Основной текст средней насыщенности
  /// Font: Roboto, Weight: Medium (500), Size: 18px, Line Height: 24px
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: AppTypography.fontSans,
    fontWeight: AppTypography.weightMedium,
    fontSize: AppTypography.size18,
    height: 24.0 / 18.0, // lineHeight / fontSize
    letterSpacing: 0.0,
    color: AppColors.blackMain,
  );

  /// Body / Bold - Основной текст жирной насыщенности
  /// Font: Roboto, Weight: Bold (700), Size: 18px, Line Height: 24px
  static const TextStyle bodyBold = TextStyle(
    fontFamily: AppTypography.fontSans,
    fontWeight: AppTypography.weightBold,
    fontSize: AppTypography.size18,
    height: 24.0 / 18.0, // lineHeight / fontSize
    letterSpacing: 0.0,
    color: AppColors.blackMain,
  );

  // ============================================
  // Small - Мелкий текст
  // ============================================

  /// Small / Regular - Мелкий текст обычной насыщенности
  /// Font: Roboto, Weight: Regular (400), Size: 14px, Line Height: 16px, Letter Spacing: 0.14
  static const TextStyle smallRegular = TextStyle(
    fontFamily: AppTypography.fontSans,
    fontWeight: AppTypography.weightRegular,
    fontSize: AppTypography.size14,
    height: 16.0 / 14.0, // lineHeight / fontSize
    letterSpacing: 0.14,
    color: AppColors.blackMain,
  );

  /// Small / Medium - Мелкий текст средней насыщенности
  /// Font: Roboto, Weight: Medium (500), Size: 14px, Line Height: 16px, Letter Spacing: 0.14
  static const TextStyle smallMedium = TextStyle(
    fontFamily: AppTypography.fontSans,
    fontWeight: AppTypography.weightMedium,
    fontSize: AppTypography.size14,
    height: 16.0 / 14.0, // lineHeight / fontSize
    letterSpacing: 0.14,
    color: AppColors.blackMain,
  );

  /// Small / Monospace - Мелкий текст моноширинный
  /// Font: Roboto, Weight: Medium (500), Size: 14px, Line Height: 16px, Letter Spacing: 0.14
  /// Используется для числовых данных и выравнивания
  static const TextStyle smallMonospace = TextStyle(
    fontFamily: AppTypography.fontSans,
    fontWeight: AppTypography.weightMedium,
    fontSize: AppTypography.size14,
    height: 16.0 / 14.0, // lineHeight / fontSize
    letterSpacing: 0.14,
    color: AppColors.blackMain,
    // В Flutter моноширинный шрифт задается через fontFeatures
    // или отдельным семейством шрифтов, если доступно
  );
}

