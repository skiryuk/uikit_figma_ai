/// Класс с отступами приложения, извлеченными из Figma Spacing Collection
class AppSpacing {
  AppSpacing._();

  // ============================================
  // Base Spacing Values - Базовые значения отступов
  // ============================================
  
  /// Spacing 0 - нулевой отступ
  static const double spacing0 = 0.0;
  
  /// Spacing 4 - минимальный отступ
  static const double spacing4 = 4.0;
  
  /// Spacing 8 - маленький отступ
  static const double spacing8 = 8.0;
  
  /// Spacing 10 - небольшой отступ
  static const double spacing10 = 10.0;
  
  /// Spacing 12 - средний отступ
  static const double spacing12 = 12.0;
  
  /// Spacing 16 - стандартный отступ
  static const double spacing16 = 16.0;
  
  /// Spacing 20 - увеличенный отступ
  static const double spacing20 = 20.0;
  
  /// Spacing 24 - большой отступ
  static const double spacing24 = 24.0;
  
  /// Spacing 28 - очень большой отступ
  static const double spacing28 = 28.0;
  
  /// Spacing 32 - максимальный отступ
  static const double spacing32 = 32.0;

  // ============================================
  // Spacing Tokens - Семантические токены отступов
  // (из SpacingTokens.tokens.json, с переиспользованием
  // базовых значений выше)
  // ============================================

  /// space-x1 — alias для базового значения 4
  static const double spaceX1 = spacing4;

  /// space-x2 — alias для базового значения 8
  static const double spaceX2 = spacing8;

  /// space-x3 — alias для базового значения 10
  static const double spaceX3 = spacing10;

  /// space-x4 — alias для базового значения 12
  static const double spaceX4 = spacing12;

  /// space-x5 — alias для базового значения 16
  static const double spaceX5 = spacing16;

  /// space-x6 — alias для базового значения 20
  static const double spaceX6 = spacing20;
}

