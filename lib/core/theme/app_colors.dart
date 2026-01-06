// Цвета приложения, извлечённые из Figma
// Источник: https://www.figma.com/design/8B2ySWiwgkrFzuRSaQV9Xa/ConfSample

import 'package:flutter/cupertino.dart';

/// Палитра цветов приложения
class AppColors {
  AppColors._();

  // === Blue (Синяя палитра) ===
  
  /// Синий цвет main (#454DE7, opacity: 0.88)
  static const Color blueMain = Color(0xE0454DE7);
  
  /// Синий цвет 800 (#3036A1, opacity: 1.0)
  static const Color blue800 = Color(0xFF3036A1);
  
  /// Синий цвет 700 (#3940BF, opacity: 1.0)
  static const Color blue700 = Color(0xFF3940BF);
  
  /// Синий цвет 600 (#454DE7, opacity: 0.60)
  static const Color blue600 = Color(0x99454DE7);
  
  /// Синий цвет 500 (#454DE7, opacity: 0.40)
  static const Color blue500 = Color(0x66454DE7);
  
  /// Синий цвет 400 (#454DE7, opacity: 0.14)
  static const Color blue400 = Color(0x24454DE7);
  
  /// Синий цвет 300 (#454DE7, opacity: 0.09)
  static const Color blue300 = Color(0x17454DE7);
  
  /// Синий цвет 200 (#454DE7, opacity: 0.05)
  static const Color blue200 = Color(0x0D454DE7);
  
  /// Синий цвет 100 (#454DE7, opacity: 1.0)
  static const Color blue100 = Color(0xFF454DE7);

  // === Black (Чёрная палитра для светлой темы) ===
  
  /// Чёрный цвет main (#08091C, opacity: 0.88)
  static const Color blackMain = Color(0xE008091C);
  
  /// Чёрный цвет 600 (#08091C, opacity: 0.60)
  static const Color black600 = Color(0x9908091C);
  
  /// Чёрный цвет 500 (#08091C, opacity: 0.40)
  static const Color black500 = Color(0x6608091C);
  
  /// Чёрный цвет 400 (#08091C, opacity: 0.14)
  static const Color black400 = Color(0x2408091C);
  
  /// Чёрный цвет 300 (#08091C, opacity: 0.09)
  static const Color black300 = Color(0x1708091C);
  
  /// Чёрный цвет 200 (#08091C, opacity: 0.06)
  static const Color black200 = Color(0x0F08091C);
  
  /// Чёрный цвет 100 (#08091C, opacity: 1.0)
  static const Color black100 = Color(0xFF08091C);

  // === White (Белая палитра для тёмной темы) ===
  
  /// Белый цвет main (#FFFFFF, opacity: 0.88)
  static const Color whiteMain = Color(0xE0FFFFFF);
  
  /// Белый цвет 600 (#FFFFFF, opacity: 0.60)
  static const Color white600 = Color(0x99FFFFFF);
  
  /// Белый цвет 500 (#FFFFFF, opacity: 0.40)
  static const Color white500 = Color(0x66FFFFFF);
  
  /// Белый цвет 400 (#FFFFFF, opacity: 0.14)
  static const Color white400 = Color(0x24FFFFFF);
  
  /// Белый цвет 300 (#FFFFFF, opacity: 0.09)
  static const Color white300 = Color(0x17FFFFFF);
  
  /// Белый цвет 200 (#FFFFFF, opacity: 0.06)
  static const Color white200 = Color(0x0FFFFFFF);
  
  /// Белый цвет 100 (#FFFFFF, opacity: 1.0)
  static const Color white100 = Color(0xFFFFFFFF);

  // === Red (Красная палитра) ===
  
  /// Красный цвет main (#E53E3E, opacity: 0.88)
  static const Color redMain = Color(0xE0E53E3E);
  
  /// Красный цвет 800 (#9E2424, opacity: 1.0)
  static const Color red800 = Color(0xFF9E2424);
  
  /// Красный цвет 700 (#C72E2E, opacity: 1.0)
  static const Color red700 = Color(0xFFC72E2E);
  
  /// Красный цвет 600 (#E53E3E, opacity: 0.60)
  static const Color red600 = Color(0x99E53E3E);
  
  /// Красный цвет 500 (#E53E3E, opacity: 0.40)
  static const Color red500 = Color(0x66E53E3E);
  
  /// Красный цвет 400 (#E53E3E, opacity: 0.14)
  static const Color red400 = Color(0x24E53E3E);
  
  /// Красный цвет 300 (#E53E3E, opacity: 0.09)
  static const Color red300 = Color(0x17E53E3E);
  
  /// Красный цвет 200 (#E53E3E, opacity: 0.05)
  static const Color red200 = Color(0x0DE53E3E);
  
  /// Красный цвет 100 (#E53E3E, opacity: 1.0)
  static const Color red100 = Color(0xFFE53E3E);

  // === Green (Зелёная палитра) ===
  
  /// Зелёный цвет main (#05B364, opacity: 0.88)
  static const Color greenMain = Color(0xE005B364);
  
  /// Зелёный цвет 800 (#037542, opacity: 1.0)
  static const Color green800 = Color(0xFF037542);
  
  /// Зелёный цвет 700 (#048A4E, opacity: 1.0)
  static const Color green700 = Color(0xFF048A4E);
  
  /// Зелёный цвет 600 (#05B364, opacity: 0.60)
  static const Color green600 = Color(0x9905B364);
  
  /// Зелёный цвет 500 (#05B364, opacity: 0.40)
  static const Color green500 = Color(0x6605B364);
  
  /// Зелёный цвет 400 (#05B364, opacity: 0.14)
  static const Color green400 = Color(0x2405B364);
  
  /// Зелёный цвет 300 (#05B364, opacity: 0.09)
  static const Color green300 = Color(0x1705B364);
  
  /// Зелёный цвет 200 (#05B364, opacity: 0.05)
  static const Color green200 = Color(0x0D05B364);
  
  /// Зелёный цвет 100 (#05B364, opacity: 1.0)
  static const Color green100 = Color(0xFF05B364);

  // === Orange (Оранжевая палитра) ===
  
  /// Оранжевый цвет main (#FF8B00, opacity: 0.88)
  static const Color orangeMain = Color(0xE0FF8B00);
  
  /// Оранжевый цвет 800 (#CC7104, opacity: 1.0)
  static const Color orange800 = Color(0xFFCC7104);
  
  /// Оранжевый цвет 700 (#E57F05, opacity: 1.0)
  static const Color orange700 = Color(0xFFE57F05);
  
  /// Оранжевый цвет 600 (#FF8B00, opacity: 0.60)
  static const Color orange600 = Color(0x99FF8B00);
  
  /// Оранжевый цвет 500 (#FF8B00, opacity: 0.40)
  static const Color orange500 = Color(0x66FF8B00);
  
  /// Оранжевый цвет 400 (#FF8B00, opacity: 0.14)
  static const Color orange400 = Color(0x24FF8B00);
  
  /// Оранжевый цвет 300 (#FF8B00, opacity: 0.09)
  static const Color orange300 = Color(0x17FF8B00);
  
  /// Оранжевый цвет 200 (#FF8B00, opacity: 0.05)
  static const Color orange200 = Color(0x0DFF8B00);
  
  /// Оранжевый цвет 100 (#FF8B00, opacity: 1.0)
  static const Color orange100 = Color(0xFFFF8B00);
}
