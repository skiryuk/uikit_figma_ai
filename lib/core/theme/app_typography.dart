import 'package:flutter/cupertino.dart';

/// Класс с параметрами типографии приложения, извлеченными из Figma Typography Collection
class AppTypography {
  AppTypography._();

  // ============================================
  // Font Family - Семейство шрифтов
  // ============================================
  
  /// Font Sans - основное семейство шрифтов
  /// Для веба используется Google Fonts 'Roboto', для мобильных - 'RobotoLocal'
  static const String fontSans = 'RobotoLocal';

  // ============================================
  // Font Weights - Насыщенность шрифта
  // ============================================
  
  /// Font Weight Regular - обычная насыщенность
  static const FontWeight weightRegular = FontWeight.w400;
  
  /// Font Weight Medium - средняя насыщенность
  static const FontWeight weightMedium = FontWeight.w500;
  
  /// Font Weight Bold - жирная насыщенность
  static const FontWeight weightBold = FontWeight.w700;

  // ============================================
  // Font Sizes - Размеры шрифта
  // ============================================
  
  /// Font Size 10 - очень маленький размер
  static const double size10 = 10.0;
  
  /// Font Size 12 - маленький размер
  static const double size12 = 12.0;
  
  /// Font Size 14 - небольшой размер
  static const double size14 = 14.0;
  
  /// Font Size 16 - стандартный размер
  static const double size16 = 16.0;
  
  /// Font Size 18 - средний размер
  static const double size18 = 18.0;
  
  /// Font Size 20 - увеличенный размер
  static const double size20 = 20.0;
  
  /// Font Size 22 - большой размер
  static const double size22 = 22.0;
  
  /// Font Size 24 - очень большой размер
  static const double size24 = 24.0;
  
  /// Font Size 26 - крупный размер
  static const double size26 = 26.0;
  
  /// Font Size 28 - очень крупный размер
  static const double size28 = 28.0;
  
  /// Font Size 30 - максимальный размер
  static const double size30 = 30.0;
  
  /// Font Size 32 - экстра большой размер
  static const double size32 = 32.0;
}

