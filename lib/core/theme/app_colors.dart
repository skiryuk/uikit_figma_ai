import 'package:flutter/cupertino.dart';

/// Цвета из коллекции Palette Figma
/// Наименования переменных соответствуют меткам из Figma
/// Проверено по node-id: 50-2044 и node-id: 10-2
class AppColors {
  AppColors._();

  // Black цвета (оттенки 100-600 + main)
  static const Color blackMain = Color(0xFF08091C);
  static const Color black600 = Color(0xE008091C); // opacity 0.88
  static const Color black500 = Color(0x9908091C); // opacity 0.6
  static const Color black400 = Color(0x6608091C); // opacity 0.4
  static const Color black300 = Color(0x2308091C); // opacity 0.14
  static const Color black200 = Color(0x1608091C); // opacity 0.09
  static const Color black100 = Color(0x0F08091C); // opacity 0.06

  // Blue цвета (оттенки 100-800 + main)
  static const Color blueMain = Color(0xFF454DE7);
  static const Color blue800 = Color(0xFF3036A1);
  static const Color blue700 = Color(0xFF3940BF);
  static const Color blue600 = Color(0xE0454DE7); // opacity 0.88
  static const Color blue500 = Color(0x99454DE7); // opacity 0.6
  static const Color blue400 = Color(0x66454DE7); // opacity 0.4
  static const Color blue300 = Color(0x23454DE7); // opacity 0.14
  static const Color blue200 = Color(0x16454DE7); // opacity 0.09
  static const Color blue100 = Color(0x0C454DE7); // opacity 0.05

  // Red цвета (оттенки 100-800 + main)
  static const Color redMain = Color(0xFFE53E3E);
  static const Color red800 = Color(0xFF9E2424); // RGB(158, 36, 36)
  static const Color red700 = Color(0xFFC72E2E); // RGB(199, 46, 46)
  static const Color red600 = Color(0xE0E53E3E); // opacity 0.88
  static const Color red500 = Color(0x99E53E3E); // opacity 0.6
  static const Color red400 = Color(0x66E53E3E); // opacity 0.4
  static const Color red300 = Color(0x23E53E3E); // opacity 0.14
  static const Color red200 = Color(0x16E53E3E); // opacity 0.09
  static const Color red100 = Color(0x0CE53E3E); // opacity 0.05

  // Green цвета (оттенки 100-800 + main)
  static const Color greenMain = Color(0xFF05B364);
  static const Color green800 = Color(0xFF037542);
  static const Color green700 = Color(0xFF048A4E);
  static const Color green600 = Color(0xE005B364); // opacity 0.88
  static const Color green500 = Color(0x9905B364); // opacity 0.6
  static const Color green400 = Color(0x6605B364); // opacity 0.4
  static const Color green300 = Color(0x2305B364); // opacity 0.14
  static const Color green200 = Color(0x1605B364); // opacity 0.09
  static const Color green100 = Color(0x0C05B364); // opacity 0.05

  // Orange цвета (оттенки 100-800 + main)
  static const Color orangeMain = Color(0xFFFF8B00);
  static const Color orange800 = Color(0xFFCC7104);
  static const Color orange700 = Color(0xFFE57F05);
  static const Color orange600 = Color(0xE0FF8B00); // opacity 0.88
  static const Color orange500 = Color(0x99FF8B00); // opacity 0.6
  static const Color orange400 = Color(0x66FF8B00); // opacity 0.4
  static const Color orange300 = Color(0x23FF8B00); // opacity 0.14
  static const Color orange200 = Color(0x16FF8B00); // opacity 0.09
  static const Color orange100 = Color(0x0CFF8B00); // opacity 0.05

  // White цвета (оттенки 100-600 + main)
  static const Color whiteMain = Color(0xFFFFFFFF);
  static const Color white600 = Color(0xE0FFFFFF); // opacity 0.88
  static const Color white500 = Color(0x99FFFFFF); // opacity 0.6
  static const Color white400 = Color(0x66FFFFFF); // opacity 0.4
  static const Color white300 = Color(0x23FFFFFF); // opacity 0.14
  static const Color white200 = Color(0x17FFFFFF); // opacity 0.09
  static const Color white100 = Color(0x0CFFFFFF); // opacity 0.05
}
