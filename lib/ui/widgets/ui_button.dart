import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_theme.dart';

/// Вариант состояния кнопки
enum UiButtonState {
  /// Обычное состояние
  defaultState,
  /// Состояние при наведении (hover)
  hover,
  /// Отключенное состояние
  disabled,
}

/// Стиль кнопки
enum UiButtonStyle {
  /// Основной стиль (с заливкой)
  main,
  /// Второстепенный стиль (с обводкой)
  minor,
}

/// Тип кнопки
enum UiButtonType {
  /// Акцентная кнопка (синяя)
  accent,
  /// Нейтральная кнопка
  neutral,
  /// Кнопка успеха (зеленая)
  success,
  /// Критическая кнопка (красная)
  critical,
}

/// Размер кнопки
enum UiButtonSize {
  /// Средний размер
  m,
  /// Маленький размер
  s,
}

/// Форма кнопки
enum UiButtonRole {
  /// Скругленные углы
  squircle,
  /// Круглая форма
  circle,
}

/// Компонент кнопки с различными вариантами представления
class UiButton extends StatelessWidget {
  /// Текст кнопки
  final String? text;

  /// Иконка слева
  final IconData? leftIcon;

  /// Иконка справа
  final IconData? rightIcon;

  /// Обработчик нажатия
  final VoidCallback? onPressed;

  /// Состояние кнопки
  final UiButtonState state;

  /// Стиль кнопки
  final UiButtonStyle style;

  /// Тип кнопки
  final UiButtonType type;

  /// Размер кнопки
  final UiButtonSize size;

  /// Форма кнопки
  final UiButtonRole role;

  /// Провайдер темы (для адаптации цветов)
  final AppThemeProvider? themeProvider;

  const UiButton({
    super.key,
    this.text,
    this.leftIcon,
    this.rightIcon,
    this.onPressed,
    this.state = UiButtonState.defaultState,
    this.style = UiButtonStyle.main,
    this.type = UiButtonType.accent,
    this.size = UiButtonSize.m,
    this.role = UiButtonRole.squircle,
    this.themeProvider,
  }) : assert(
          text != null || leftIcon != null || rightIcon != null,
          'Кнопка должна содержать текст или хотя бы одну иконку',
        );

  @override
  Widget build(BuildContext context) {
    final isDisabled = state == UiButtonState.disabled || onPressed == null;
    final colors = _getButtonColors(isDisabled);
    final padding = _getPadding();
    final borderRadius = _getBorderRadius();
    final textStyle = _getTextStyle();

    Widget content = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leftIcon != null) ...[
          Icon(
            leftIcon,
            size: _getIconSize(),
            color: colors.textColor,
          ),
          if (text != null) SizedBox(width: AppSpacing.spacing4),
        ],
        if (text != null)
          Text(
            text!,
            style: textStyle.copyWith(color: colors.textColor),
          ),
        if (rightIcon != null) ...[
          if (text != null) SizedBox(width: AppSpacing.spacing4),
          Icon(
            rightIcon,
            size: _getIconSize(),
            color: colors.textColor,
          ),
        ],
      ],
    );

    // Если только иконка, делаем квадратную/круглую кнопку
    if (text == null && (leftIcon != null || rightIcon != null)) {
      content = Padding(
        padding: padding,
        child: Icon(
          leftIcon ?? rightIcon,
          size: _getIconSize(),
          color: colors.textColor,
        ),
      );
    } else {
      content = Padding(
        padding: padding,
        child: content,
      );
    }

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: isDisabled ? null : onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: colors.backgroundColor,
          borderRadius: borderRadius,
          border: style == UiButtonStyle.minor
              ? Border.all(
                  color: colors.borderColor,
                  width: 1,
                )
              : null,
        ),
        child: content,
      ),
    );
  }

  /// Получить цвета кнопки в зависимости от типа и стиля
  _ButtonColors _getButtonColors(bool isDisabled) {
    if (isDisabled) {
      return _ButtonColors(
        backgroundColor: style == UiButtonStyle.main
            ? (themeProvider?.isDarkMode ?? false
                ? AppColors.white300
                : AppColors.black300)
            : Colors.transparent,
        textColor: themeProvider?.isDarkMode ?? false
            ? AppColors.white400
            : AppColors.black400,
        borderColor: themeProvider?.isDarkMode ?? false
            ? AppColors.white300
            : AppColors.black300,
      );
    }

    Color backgroundColor;
    Color textColor;
    Color borderColor;

    switch (type) {
      case UiButtonType.accent:
        backgroundColor = style == UiButtonStyle.main
            ? AppColors.blueMain
            : Colors.transparent;
        textColor = style == UiButtonStyle.main
            ? AppColors.whiteMain
            : AppColors.blueMain;
        borderColor = AppColors.blueMain;
        break;
      case UiButtonType.neutral:
        backgroundColor = style == UiButtonStyle.main
            ? (themeProvider?.isDarkMode ?? false
                ? AppColors.white300
                : AppColors.black300)
            : Colors.transparent;
        textColor = themeProvider?.isDarkMode ?? false
            ? AppColors.whiteMain
            : AppColors.blackMain;
        borderColor = themeProvider?.isDarkMode ?? false
            ? AppColors.white300
            : AppColors.black300;
        break;
      case UiButtonType.success:
        backgroundColor = style == UiButtonStyle.main
            ? AppColors.greenMain
            : Colors.transparent;
        textColor = style == UiButtonStyle.main
            ? AppColors.whiteMain
            : AppColors.greenMain;
        borderColor = AppColors.greenMain;
        break;
      case UiButtonType.critical:
        backgroundColor = style == UiButtonStyle.main
            ? AppColors.redMain
            : Colors.transparent;
        textColor = style == UiButtonStyle.main
            ? AppColors.whiteMain
            : AppColors.redMain;
        borderColor = AppColors.redMain;
        break;
    }

    // Hover state - немного затемняем фон
    if (state == UiButtonState.hover && style == UiButtonStyle.main) {
      backgroundColor = Color.lerp(
        backgroundColor,
        AppColors.blackMain,
        0.1,
      )!;
    }

    return _ButtonColors(
      backgroundColor: backgroundColor,
      textColor: textColor,
      borderColor: borderColor,
    );
  }

  /// Получить отступы в зависимости от размера
  EdgeInsets _getPadding() {
    switch (size) {
      case UiButtonSize.m:
        return const EdgeInsets.symmetric(
          horizontal: AppSpacing.spacing16,
          vertical: AppSpacing.spacing12,
        );
      case UiButtonSize.s:
        return const EdgeInsets.symmetric(
          horizontal: AppSpacing.spacing12,
          vertical: AppSpacing.spacing8,
        );
    }
  }

  /// Получить радиус скругления в зависимости от формы
  BorderRadius _getBorderRadius() {
    switch (role) {
      case UiButtonRole.squircle:
        return BorderRadius.circular(AppSpacing.spacing8);
      case UiButtonRole.circle:
        return BorderRadius.circular(999); // Полностью круглый
    }
  }

  /// Получить стиль текста в зависимости от размера
  TextStyle _getTextStyle() {
    switch (size) {
      case UiButtonSize.m:
        return AppTextStyles.bodyMedium;
      case UiButtonSize.s:
        return AppTextStyles.smallMedium;
    }
  }

  /// Получить размер иконки в зависимости от размера кнопки
  double _getIconSize() {
    switch (size) {
      case UiButtonSize.m:
        return 24.0;
      case UiButtonSize.s:
        return 20.0;
    }
  }
}

/// Вспомогательный класс для хранения цветов кнопки
class _ButtonColors {
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  _ButtonColors({
    required this.backgroundColor,
    required this.textColor,
    required this.borderColor,
  });
}

