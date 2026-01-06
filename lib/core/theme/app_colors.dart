import 'package:flutter/cupertino.dart';

/// Цветовая палитра приложения из коллекции Palette
/// Цвета соответствуют переменным Variables / Collection / Palette из Figma
/// Наименования переменных соответствуют меткам цветов в Figma: 800, 700, main, 600, 500, 400, 300, 200, 100
class AppColors {
  AppColors._();

  // Blue цвета
  static const Color blue800 = Color(0xFF3036A1); // VariableID:4:59 (Figma 800)
  static const Color blue700 = Color(0xFF3940BF); // VariableID:4:58 (Figma 700)
  static const Color blueMain = Color(0xFF454DE7); // VariableID:4:51 (Figma main)
  static const Color blue600 = Color(0xE0454DE7); // VariableID:4:52 (opacity 0.88)
  static const Color blue500 = Color(0x99454DE7); // VariableID:4:53 (opacity 0.60)
  static const Color blue400 = Color(0x66454DE7); // VariableID:4:54 (opacity 0.40)
  static const Color blue300 = Color(0x23454DE7); // VariableID:4:55 (opacity 0.14)
  static const Color blue200 = Color(0x16454DE7); // VariableID:4:56 (opacity 0.09)
  static const Color blue100 = Color(0x0C454DE7); // VariableID:4:57 (opacity 0.05)

  // Red цвета
  static const Color red800 = Color(0xFF9E2424); // VariableID:4:65 (Figma 800)
  static const Color red700 = Color(0xFFC72E2E); // VariableID:4:64 (Figma 700)
  static const Color redMain = Color(0xFFE53E3E); // VariableID:4:66 (Figma main)
  static const Color red600 = Color(0xE0E53E3E); // VariableID:4:67 (opacity 0.88)
  static const Color red500 = Color(0x99E53E3E); // VariableID:4:68 (opacity 0.60)
  static const Color red400 = Color(0x66E53E3E); // VariableID:4:69 (opacity 0.40)
  static const Color red300 = Color(0x23E53E3E); // VariableID:4:70 (opacity 0.14)
  static const Color red200 = Color(0x16E53E3E); // VariableID:4:71 (opacity 0.09)
  static const Color red100 = Color(0x0CE53E3E); // VariableID:4:72 (opacity 0.05)

  // Green цвета
  static const Color green800 = Color(0xFF037542); // VariableID:4:82 (Figma 800)
  static const Color green700 = Color(0xFF048A4E); // VariableID:4:83 (Figma 700)
  static const Color greenMain = Color(0xFF05B364); // VariableID:4:84 (Figma main)
  static const Color green600 = Color(0xE005B364); // VariableID:4:85 (opacity 0.88)
  static const Color green500 = Color(0x9905B364); // VariableID:4:86 (opacity 0.60)
  static const Color green400 = Color(0x6605B364); // VariableID:4:87 (opacity 0.40)
  static const Color green300 = Color(0x2305B364); // VariableID:4:88 (opacity 0.14)
  static const Color green200 = Color(0x1605B364); // VariableID:4:89 (opacity 0.09)
  static const Color green100 = Color(0x0C05B364); // VariableID:4:90 (opacity 0.05)

  // Orange цвета
  static const Color orange800 = Color(0xFFCC7104); // VariableID:4:73 (Figma 800)
  static const Color orange700 = Color(0xFFE57F05); // VariableID:4:74 (Figma 700)
  static const Color orangeMain = Color(0xFFFF8B00); // VariableID:4:75 (Figma main)
  static const Color orange600 = Color(0xE0FF8B00); // VariableID:4:76 (opacity 0.88)
  static const Color orange500 = Color(0x99FF8B00); // VariableID:4:77 (opacity 0.60)
  static const Color orange400 = Color(0x66FF8B00); // VariableID:4:78 (opacity 0.40)
  static const Color orange300 = Color(0x23FF8B00); // VariableID:4:79 (opacity 0.14)
  static const Color orange200 = Color(0x16FF8B00); // VariableID:4:80 (opacity 0.09)
  static const Color orange100 = Color(0x0CFF8B00); // VariableID:4:81 (opacity 0.05)

  // Black цвета
  static const Color blackMain = Color(0xFF08091C); // VariableID:4:44 (Figma main)
  static const Color black600 = Color(0xE008091C); // VariableID:4:45 (opacity 0.88)
  static const Color black500 = Color(0x9908091C); // VariableID:4:46 (opacity 0.60)
  static const Color black400 = Color(0x6608091C); // VariableID:4:47 (opacity 0.40)
  static const Color black300 = Color(0x2308091C); // VariableID:4:48 (opacity 0.14)
  static const Color black200 = Color(0x1608091C); // VariableID:4:49 (opacity 0.09)
  static const Color black100 = Color(0x0F08091C); // VariableID:4:50 (opacity 0.06)

  // White цвета
  static const Color whiteMain = Color(0xFFFFFFFF); // Основной белый цвет
  static const Color white600 = Color(0xE0FFFFFF); // opacity 0.88
  static const Color white500 = Color(0x99FFFFFF); // opacity 0.60
  static const Color white400 = Color(0x66FFFFFF); // opacity 0.40
  static const Color white300 = Color(0x23FFFFFF); // opacity 0.14
  static const Color white200 = Color(0x16FFFFFF); // opacity 0.09
  static const Color white100 = Color(0x0CFFFFFF); // opacity 0.05
}
