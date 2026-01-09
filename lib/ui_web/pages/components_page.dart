import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/app_text_styles_web.dart';
import '../../core/theme/app_spacing.dart';
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
    return Row(
      children: [
        // Панель настроек
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              color: widget.themeProvider.backgroundColor,
              border: Border(
                right: BorderSide(
                  color: widget.themeProvider.borderPrimary,
                  width: 1,
                ),
              ),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'UiButton',
                    style: AppTextStylesWeb.h1.copyWith(
                      color: widget.themeProvider.textPrimary,
                    ),
                  ),
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
            color: widget.themeProvider.backgroundColor,
            child: Center(
              child: _buildPhonePreview(),
            ),
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
            color: widget.themeProvider.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          style: AppTextStylesWeb.bodyRegular.copyWith(
            color: widget.themeProvider.textPrimary,
          ),
          decoration: InputDecoration(
            hintText: 'Введите текст кнопки',
            hintStyle: AppTextStylesWeb.bodyRegular.copyWith(
              color: widget.themeProvider.textSecondary,
            ),
            filled: true,
            fillColor: widget.themeProvider.backgroundColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: widget.themeProvider.borderPrimary,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: widget.themeProvider.borderPrimary,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: widget.themeProvider.textPrimary,
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
            color: widget.themeProvider.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        CheckboxListTile(
          title: Text(
            'Left Icon',
            style: AppTextStylesWeb.bodyRegular.copyWith(
              color: widget.themeProvider.textPrimary,
            ),
          ),
          value: _hasLeftIcon,
          onChanged: (value) {
            setState(() {
              _hasLeftIcon = value ?? false;
            });
          },
          activeColor: widget.themeProvider.textPrimary,
        ),
        CheckboxListTile(
          title: Text(
            'Right Icon',
            style: AppTextStylesWeb.bodyRegular.copyWith(
              color: widget.themeProvider.textPrimary,
            ),
          ),
          value: _hasRightIcon,
          onChanged: (value) {
            setState(() {
              _hasRightIcon = value ?? false;
            });
          },
          activeColor: widget.themeProvider.textPrimary,
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
            color: widget.themeProvider.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        ...options.map((option) => RadioListTile<T>(
              title: Text(
                getLabel(option),
                style: AppTextStylesWeb.bodyRegular.copyWith(
                  color: widget.themeProvider.textPrimary,
                ),
              ),
              value: option,
              groupValue: currentValue,
              onChanged: (value) {
                if (value != null) onChanged(value);
              },
              activeColor: widget.themeProvider.textPrimary,
            )),
      ],
    );
  }

  Widget _buildPhonePreview() {
    return Container(
      width: 375,
      height: 812,
      decoration: BoxDecoration(
        color: widget.themeProvider.backgroundColor,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: widget.themeProvider.borderPrimary,
          width: 8,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
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
    );
  }
}

