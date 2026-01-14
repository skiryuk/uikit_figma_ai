import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/app_text_styles_web.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_theme_tokens.dart';
import '../../ui/widgets/ui_button.dart';

class ComponentsPage extends StatefulWidget {
  final AppThemeProvider themeProvider;

  const ComponentsPage({super.key, required this.themeProvider});

  @override
  State<ComponentsPage> createState() => _ComponentsPageState();
}

class _ComponentsPageState extends State<ComponentsPage> {
  // Параметры кнопки
  String _buttonText = 'Button';
  bool _hasLeftIcon = false;
  bool _hasRightIcon = false;
  UiButtonState _buttonState = UiButtonState.defaultState;
  UiButtonStyle _buttonStyle = UiButtonStyle.main;
  UiButtonType _buttonType = UiButtonType.accent;
  UiButtonSize _buttonSize = UiButtonSize.m;
  UiButtonRole _buttonRole = UiButtonRole.squircle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: widget.themeProvider.isDarkMode
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  widget.themeProvider.backgroundColor,
                  widget.themeProvider.backgroundColor.withOpacity(0.95),
                ],
              )
            : null,
      ),
      child: Row(
        children: [
          // Панель настроек
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: widget.themeProvider.isDarkMode
                    ? widget.themeProvider.surfaceNeutralHigh
                    : Colors.white,
                border: Border(
                  right: BorderSide(
                    color: widget.themeProvider.borderPrimary.withOpacity(0.1),
                    width: 1,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(2, 0),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPageHeader(),
                    const SizedBox(height: 32),
                    _buildTextInput(),
                    const SizedBox(height: 24),
                    _buildIconControls(),
                    const SizedBox(height: 24),
                    _buildStateSelector(),
                    const SizedBox(height: 24),
                    _buildStyleSelector(),
                    const SizedBox(height: 24),
                    _buildTypeSelector(),
                    const SizedBox(height: 24),
                    _buildSizeSelector(),
                    const SizedBox(height: 24),
                    _buildRoleSelector(),
                  ],
                ),
              ),
            ),
          ),
          // Предпросмотр
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                gradient: widget.themeProvider.isDarkMode
                    ? LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          widget.themeProvider.backgroundColor,
                          widget.themeProvider.surfaceNeutralHigh,
                        ],
                      )
                    : null,
              ),
              child: _buildPhonePreview(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 32,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF454DE7),
                    Color(0xFF6B73FF),
                  ],
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'UiButton',
                style: AppTextStylesWeb.h1.copyWith(
                  color: widget.themeProvider.isDarkMode
                      ? AppColors.blackMain
                      : widget.themeProvider.textPrimary,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          'Настройте параметры кнопки и посмотрите результат в реальном времени',
          style: AppTextStylesWeb.bodyRegular.copyWith(
            color: widget.themeProvider.isDarkMode
                ? AppColors.black500
                : widget.themeProvider.textSecondary,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildTextInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Text',
          style: AppTextStylesWeb.bodyBold.copyWith(
            color: widget.themeProvider.isDarkMode
                ? AppColors.blackMain
                : widget.themeProvider.textPrimary,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          style: AppTextStylesWeb.bodyRegular.copyWith(
            color: widget.themeProvider.isDarkMode
                ? AppColors.blackMain
                : widget.themeProvider.textPrimary,
          ),
          decoration: InputDecoration(
            hintText: 'Введите текст кнопки',
            hintStyle: AppTextStylesWeb.bodyRegular.copyWith(
              color: widget.themeProvider.isDarkMode
                  ? AppColors.black400
                  : widget.themeProvider.textSecondary,
            ),
            filled: true,
            fillColor: widget.themeProvider.isDarkMode
                ? AppThemeLightTokens.surfaceNeutralLow
                : widget.themeProvider.surfaceNeutralLow,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: widget.themeProvider.isDarkMode
                    ? AppThemeLightTokens.borderPrimary
                    : widget.themeProvider.borderPrimary.withOpacity(0.1),
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: widget.themeProvider.isDarkMode
                    ? AppThemeLightTokens.borderPrimary
                    : widget.themeProvider.borderPrimary.withOpacity(0.1),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xFF454DE7),
                width: 2,
              ),
            ),
          ),
          onChanged: (value) {
            setState(() {
              _buttonText = value.isEmpty ? 'Button' : value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildIconControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Icons',
          style: AppTextStylesWeb.bodyBold.copyWith(
            color: widget.themeProvider.isDarkMode
                ? AppColors.blackMain
                : widget.themeProvider.textPrimary,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: widget.themeProvider.isDarkMode
                ? AppThemeLightTokens.surfaceNeutralLow
                : widget.themeProvider.surfaceNeutralLow,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: widget.themeProvider.isDarkMode
                  ? AppThemeLightTokens.borderPrimary
                  : Colors.transparent,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              CheckboxListTile(
                title: Text(
                  'Left Icon',
                  style: AppTextStylesWeb.bodyRegular.copyWith(
                    color: widget.themeProvider.isDarkMode
                        ? AppColors.blackMain
                        : widget.themeProvider.textPrimary,
                  ),
                ),
                value: _hasLeftIcon,
                onChanged: (value) {
                  setState(() {
                    _hasLeftIcon = value ?? false;
                  });
                },
                activeColor: const Color(0xFF454DE7),
                checkColor: widget.themeProvider.isDarkMode
                    ? Colors.white
                    : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Divider(
                height: 1,
                color: widget.themeProvider.isDarkMode
                    ? AppThemeLightTokens.borderPrimary.withOpacity(0.1)
                    : widget.themeProvider.borderPrimary.withOpacity(0.1),
              ),
              CheckboxListTile(
                title: Text(
                  'Right Icon',
                  style: AppTextStylesWeb.bodyRegular.copyWith(
                    color: widget.themeProvider.isDarkMode
                        ? AppColors.blackMain
                        : widget.themeProvider.textPrimary,
                  ),
                ),
                value: _hasRightIcon,
                onChanged: (value) {
                  setState(() {
                    _hasRightIcon = value ?? false;
                  });
                },
                activeColor: const Color(0xFF454DE7),
                checkColor: widget.themeProvider.isDarkMode
                    ? Colors.white
                    : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStateSelector() {
    return _buildSelector<UiButtonState>(
      'State',
      _buttonState,
      UiButtonState.values,
      (state) => state.toString().replaceAll('UiButtonState.', ''),
      (value) {
        setState(() {
          _buttonState = value;
        });
      },
    );
  }

  Widget _buildStyleSelector() {
    return _buildSelector<UiButtonStyle>(
      'Style',
      _buttonStyle,
      UiButtonStyle.values,
      (style) => style.toString().replaceAll('UiButtonStyle.', ''),
      (value) {
        setState(() {
          _buttonStyle = value;
        });
      },
    );
  }

  Widget _buildTypeSelector() {
    return _buildSelector<UiButtonType>(
      'Type',
      _buttonType,
      UiButtonType.values,
      (type) => type.toString().replaceAll('UiButtonType.', ''),
      (value) {
        setState(() {
          _buttonType = value;
        });
      },
    );
  }

  Widget _buildSizeSelector() {
    return _buildSelector<UiButtonSize>(
      'Size',
      _buttonSize,
      UiButtonSize.values,
      (size) => size.toString().replaceAll('UiButtonSize.', '').toUpperCase(),
      (value) {
        setState(() {
          _buttonSize = value;
        });
      },
    );
  }

  Widget _buildRoleSelector() {
    return _buildSelector<UiButtonRole>(
      'Role',
      _buttonRole,
      UiButtonRole.values,
      (role) => role.toString().replaceAll('UiButtonRole.', ''),
      (value) {
        setState(() {
          _buttonRole = value;
        });
      },
    );
  }

  Widget _buildSelector<T>(
    String label,
    T currentValue,
    List<T> options,
    String Function(T) getLabel,
    ValueChanged<T> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStylesWeb.bodyBold.copyWith(
            color: widget.themeProvider.isDarkMode
                ? AppColors.blackMain
                : widget.themeProvider.textPrimary,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: widget.themeProvider.isDarkMode
                ? AppThemeLightTokens.surfaceNeutralLow
                : widget.themeProvider.surfaceNeutralLow,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: widget.themeProvider.isDarkMode
                  ? AppThemeLightTokens.borderPrimary
                  : Colors.transparent,
              width: 1,
            ),
          ),
          child: Column(
            children: options.asMap().entries.map((entry) {
              final index = entry.key;
              final option = entry.value;
              final isLast = index == options.length - 1;
              return Column(
                children: [
                  RadioListTile<T>(
                    title: Text(
                      getLabel(option),
                      style: AppTextStylesWeb.bodyRegular.copyWith(
                        color: widget.themeProvider.isDarkMode
                            ? AppColors.blackMain
                            : widget.themeProvider.textPrimary,
                      ),
                    ),
                    value: option,
                    groupValue: currentValue,
                    onChanged: (value) {
                      if (value != null) onChanged(value);
                    },
                    activeColor: const Color(0xFF454DE7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  if (!isLast)
                    Divider(
                      height: 1,
                      indent: 16,
                      endIndent: 16,
                      color: widget.themeProvider.isDarkMode
                          ? AppThemeLightTokens.borderPrimary.withOpacity(0.1)
                          : widget.themeProvider.borderPrimary.withOpacity(0.1),
                    ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildPhonePreview() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight - 64,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Заголовок предпросмотра
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: widget.themeProvider.isDarkMode
                        ? widget.themeProvider.surfaceNeutralHigh
                        : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: widget.themeProvider.borderPrimary.withOpacity(0.1),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(
                          widget.themeProvider.isDarkMode ? 0.3 : 0.05,
                        ),
                        blurRadius: 20,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Предпросмотр',
                        style: AppTextStylesWeb.h2.copyWith(
                          color: widget.themeProvider.isDarkMode
                              ? AppColors.blackMain
                              : widget.themeProvider.textPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Изменения применяются в реальном времени',
                        style: AppTextStylesWeb.smallRegular.copyWith(
                          color: widget.themeProvider.isDarkMode
                              ? AppColors.black500
                              : widget.themeProvider.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Мобильный предпросмотр
                Container(
                  width: 375,
                  height: 812,
                  decoration: BoxDecoration(
                    color: widget.themeProvider.backgroundColor,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: widget.themeProvider.borderPrimary.withOpacity(0.2),
                      width: 8,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 30,
                        spreadRadius: 10,
                      ),
                      BoxShadow(
                        color: const Color(0xFF454DE7).withOpacity(0.2),
                        blurRadius: 40,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: Container(
                      color: widget.themeProvider.backgroundColor,
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          UiButton(
                            text: _buttonText.isEmpty ? null : _buttonText,
                            leftIcon: _hasLeftIcon ? CupertinoIcons.heart : null,
                            rightIcon: _hasRightIcon ? CupertinoIcons.arrow_right : null,
                            state: _buttonState,
                            style: _buttonStyle,
                            type: _buttonType,
                            size: _buttonSize,
                            role: _buttonRole,
                            themeProvider: widget.themeProvider,
                            onPressed: _buttonState == UiButtonState.disabled 
                                ? null 
                                : () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

