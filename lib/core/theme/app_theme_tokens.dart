import 'dart:ui';

import 'app_colors.dart';

/// Дизайн‑токены для светлой темы (Light.tokens.json),
/// построенные на основе палитры `AppColors`.
class AppThemeLightTokens {
  AppThemeLightTokens._();

  // ============================================
  // Border
  // ============================================

  /// border.primary → black/300
  static const Color borderPrimary = AppColors.black300;

  /// border.secondary → black/200
  static const Color borderSecondary = AppColors.black200;

  // ============================================
  // Text
  // ============================================

  /// text.primary → black/main
  static const Color textPrimary = AppColors.blackMain;

  /// text.secondary → black/500
  static const Color textSecondary = AppColors.black500;

  /// text.disabled → black/400
  static const Color textDisabled = AppColors.black400;

  /// text.accent → blue/main
  static const Color textAccent = AppColors.blueMain;

  /// text.critical → red/800
  static const Color textCritical = AppColors.red800;

  /// text.caution → orange/main
  static const Color textCaution = AppColors.orangeMain;

  /// text.success → green/800
  static const Color textSuccess = AppColors.green800;

  /// text.primary-inverse → white/main
  static const Color textPrimaryInverse = AppColors.whiteMain;

  /// text.primary-on-color → white/main
  static const Color textPrimaryOnColor = AppColors.whiteMain;

  // ============================================
  // Icon
  // ============================================

  /// icon.primary → black/main
  static const Color iconPrimary = AppColors.blackMain;

  /// icon.secondary → black/500
  static const Color iconSecondary = AppColors.black500;

  /// icon.disabled → black/400
  static const Color iconDisabled = AppColors.black400;

  /// icon.accent → blue/main
  static const Color iconAccent = AppColors.blueMain;

  /// icon.critical → red/800
  static const Color iconCritical = AppColors.red800;

  /// icon.caution → orange/main
  static const Color iconCaution = AppColors.orangeMain;

  /// icon.success → green/800
  static const Color iconSuccess = AppColors.green800;

  // ============================================
  // Background (bg)
  // ============================================

  /// bg.primary → white/main
  static const Color bgPrimary = AppColors.whiteMain;

  /// bg.primary-hover → black/100
  static const Color bgPrimaryHover = AppColors.black100;

  /// bg.primary-active → black/200
  static const Color bgPrimaryActive = AppColors.black200;

  /// bg.secondary → black/100
  static const Color bgSecondary = AppColors.black100;

  /// bg.secondary-hover → black/200
  static const Color bgSecondaryHover = AppColors.black200;

  /// bg.secondary-active → black/300
  static const Color bgSecondaryActive = AppColors.black300;

  /// bg.accent → blue/main
  static const Color bgAccent = AppColors.blueMain;

  /// bg.accent-hover → blue/700
  static const Color bgAccentHover = AppColors.blue700;

  /// bg.accent-active → blue/800
  static const Color bgAccentActive = AppColors.blue800;

  /// bg.acccent-subdued → blue/100 (опечатка в JSON сохранена)
  static const Color bgAcccentSubdued = AppColors.blue100;

  /// bg.accent-subdued-hover → blue/200
  static const Color bgAccentSubduedHover = AppColors.blue200;

  /// bg.accent-subdued-active → blue/300
  static const Color bgAccentSubduedActive = AppColors.blue300;

  /// bg.primary-inverse → black/600
  static const Color bgPrimaryInverse = AppColors.black600;

  /// bg.secondary-inverse → black/500
  static const Color bgSecondaryInverse = AppColors.black500;

  // ============================================
  // Surface
  // ============================================

  /// surface.default → white/main
  static const Color surfaceDefault = AppColors.whiteMain;

  /// surface.success.main → green/main
  static const Color surfaceSuccessMain = AppColors.greenMain;

  /// surface.success.hover → green/700
  static const Color surfaceSuccessHover = AppColors.green700;

  /// surface.success.medium → green/400
  static const Color surfaceSuccessMedium = AppColors.green400;

  /// surface.success.low → green/200
  static const Color surfaceSuccessLow = AppColors.green200;

  /// surface.neutral.default → black/100
  static const Color surfaceNeutralDefault = AppColors.black100;

  /// surface.neutral.low → black/100
  static const Color surfaceNeutralLow = AppColors.black100;

  /// surface.neutral.medium → black/300
  static const Color surfaceNeutralMedium = AppColors.black300;

  /// surface.neutral.high → black/main
  static const Color surfaceNeutralHigh = AppColors.blackMain;

  /// surface.accent.main → blue/main
  static const Color surfaceAccentMain = AppColors.blueMain;

  /// surface.accent.hover → blue/700
  static const Color surfaceAccentHover = AppColors.blue700;

  /// surface.accent.medium → blue/300
  static const Color surfaceAccentMedium = AppColors.blue300;

  /// surface.accent.low → blue/200
  static const Color surfaceAccentLow = AppColors.blue200;

  /// surface.critical.main → red/main
  static const Color surfaceCriticalMain = AppColors.redMain;

  /// surface.critical.hover → red/700
  static const Color surfaceCriticalHover = AppColors.red700;

  /// surface.critical.medium → red/400
  static const Color surfaceCriticalMedium = AppColors.red400;

  /// surface.critical.low → red/200
  static const Color surfaceCriticalLow = AppColors.red200;
}

/// Дизайн‑токены для тёмной темы (Dark.tokens.json),
/// построенные на основе палитры `AppColors`.
class AppThemeDarkTokens {
  AppThemeDarkTokens._();

  // ============================================
  // Border
  // ============================================

  /// border.primary → white/300
  static const Color borderPrimary = AppColors.white300;

  /// border.secondary → white/200
  static const Color borderSecondary = AppColors.white200;

  // ============================================
  // Text
  // ============================================

  /// text.primary → white/main
  static const Color textPrimary = AppColors.whiteMain;

  /// text.secondary → white/500
  static const Color textSecondary = AppColors.white500;

  /// text.disabled → white/400
  static const Color textDisabled = AppColors.white400;

  /// text.accent → blue/main
  static const Color textAccent = AppColors.blueMain;

  /// text.critical → red/800
  static const Color textCritical = AppColors.red800;

  /// text.caution → orange/main
  static const Color textCaution = AppColors.orangeMain;

  /// text.success → green/800
  static const Color textSuccess = AppColors.green800;

  /// text.primary-inverse → black/main
  static const Color textPrimaryInverse = AppColors.blackMain;

  /// text.primary-on-color → white/main
  static const Color textPrimaryOnColor = AppColors.whiteMain;

  // ============================================
  // Icon
  // ============================================

  /// icon.primary → white/main
  static const Color iconPrimary = AppColors.whiteMain;

  /// icon.secondary → white/500
  static const Color iconSecondary = AppColors.white500;

  /// icon.disabled → white/400
  static const Color iconDisabled = AppColors.white400;

  /// icon.accent → blue/main
  static const Color iconAccent = AppColors.blueMain;

  /// icon.critical → red/800
  static const Color iconCritical = AppColors.red800;

  /// icon.caution → orange/main
  static const Color iconCaution = AppColors.orangeMain;

  /// icon.success → green/800
  static const Color iconSuccess = AppColors.green800;

  // ============================================
  // Background (bg)
  // ============================================

  /// bg.primary → black/main
  static const Color bgPrimary = AppColors.blackMain;

  /// bg.primary-hover → white/200
  static const Color bgPrimaryHover = AppColors.white200;

  /// bg.primary-active → white/200
  static const Color bgPrimaryActive = AppColors.white200;

  /// bg.secondary → white/100
  static const Color bgSecondary = AppColors.white100;

  /// bg.secondary-hover → white/300
  static const Color bgSecondaryHover = AppColors.white300;

  /// bg.secondary-active → white/200
  static const Color bgSecondaryActive = AppColors.white200;

  /// bg.accent → blue/main
  static const Color bgAccent = AppColors.blueMain;

  /// bg.accent-hover → blue/700
  static const Color bgAccentHover = AppColors.blue700;

  /// bg.accent-active → blue/800
  static const Color bgAccentActive = AppColors.blue800;

  /// bg.acccent-subdued → blue/100 (опечатка в JSON сохранена)
  static const Color bgAcccentSubdued = AppColors.blue100;

  /// bg.accent-subdued-hover → blue/200
  static const Color bgAccentSubduedHover = AppColors.blue200;

  /// bg.accent-subdued-active → blue/300
  static const Color bgAccentSubduedActive = AppColors.blue300;

  /// bg.primary-inverse → white/600
  static const Color bgPrimaryInverse = AppColors.white600;

  /// bg.secondary-inverse → white/500
  static const Color bgSecondaryInverse = AppColors.white500;

  // ============================================
  // Surface
  // ============================================

  /// surface.default → black/main
  static const Color surfaceDefault = AppColors.blackMain;

  /// surface.success.main → green/main
  static const Color surfaceSuccessMain = AppColors.greenMain;

  /// surface.success.hover → green/700
  static const Color surfaceSuccessHover = AppColors.green700;

  /// surface.success.medium → green/400
  static const Color surfaceSuccessMedium = AppColors.green400;

  /// surface.success.low → green/200
  static const Color surfaceSuccessLow = AppColors.green200;

  /// surface.neutral.default → white/200
  static const Color surfaceNeutralDefault = AppColors.white200;

  /// surface.neutral.low → white/100
  static const Color surfaceNeutralLow = AppColors.white100;

  /// surface.neutral.medium → white/300
  static const Color surfaceNeutralMedium = AppColors.white300;

  /// surface.neutral.high → white/main
  static const Color surfaceNeutralHigh = AppColors.whiteMain;

  /// surface.accent.main → blue/main
  static const Color surfaceAccentMain = AppColors.blueMain;

  /// surface.accent.hover → blue/700
  static const Color surfaceAccentHover = AppColors.blue700;

  /// surface.accent.medium → blue/300
  static const Color surfaceAccentMedium = AppColors.blue300;

  /// surface.accent.low → blue/200
  static const Color surfaceAccentLow = AppColors.blue200;

  /// surface.critical.main → red/main
  static const Color surfaceCriticalMain = AppColors.redMain;

  /// surface.critical.hover → red/700
  static const Color surfaceCriticalHover = AppColors.red700;

  /// surface.critical.medium → red/400
  static const Color surfaceCriticalMedium = AppColors.red400;

  /// surface.critical.low → red/200
  static const Color surfaceCriticalLow = AppColors.red200;
}


