import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../../core/theme/app_text_styles_web.dart';
import '../../core/theme/app_theme_tokens.dart';

class TokensPage extends StatelessWidget {
  final AppThemeProvider themeProvider;

  const TokensPage({super.key, required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Design Tokens',
            style: AppTextStylesWeb.h1.copyWith(color: themeProvider.textPrimary),
          ),
          const SizedBox(height: 32),
          _buildColorsSection(),
          const SizedBox(height: 32),
          _buildSpacingSection(),
          const SizedBox(height: 32),
          _buildTypographySection(),
          const SizedBox(height: 32),
          _buildThemeTokensSection(),
        ],
      ),
    );
  }

  Widget _buildColorsSection() {
    final isDarkMode = themeProvider.isDarkMode;
    
    return _buildSection(
      'Colors',
      [
        // В светлой теме отображаем черные цвета, в темной - белые
        if (!isDarkMode) // Светлая тема - показываем черные цвета
          _buildTokenGroup('Black Colors', [
            ('blackMain', AppColors.blackMain),
            ('black600', AppColors.black600),
            ('black500', AppColors.black500),
            ('black400', AppColors.black400),
            ('black300', AppColors.black300),
            ('black200', AppColors.black200),
            ('black100', AppColors.black100),
          ]),
        if (isDarkMode) // Темная тема - показываем белые цвета
          _buildTokenGroup('White Colors', [
            ('whiteMain', AppColors.whiteMain),
            ('white600', AppColors.white600),
            ('white500', AppColors.white500),
            ('white400', AppColors.white400),
            ('white300', AppColors.white300),
            ('white200', AppColors.white200),
            ('white100', AppColors.white100),
          ]),
        _buildTokenGroup('Blue Colors', [
          ('blueMain', AppColors.blueMain),
          ('blue800', AppColors.blue800),
          ('blue700', AppColors.blue700),
          ('blue600', AppColors.blue600),
          ('blue500', AppColors.blue500),
          ('blue400', AppColors.blue400),
          ('blue300', AppColors.blue300),
          ('blue200', AppColors.blue200),
          ('blue100', AppColors.blue100),
        ]),
        _buildTokenGroup('Red Colors', [
          ('redMain', AppColors.redMain),
          ('red800', AppColors.red800),
          ('red700', AppColors.red700),
          ('red600', AppColors.red600),
          ('red500', AppColors.red500),
          ('red400', AppColors.red400),
          ('red300', AppColors.red300),
          ('red200', AppColors.red200),
          ('red100', AppColors.red100),
        ]),
        _buildTokenGroup('Orange Colors', [
          ('orangeMain', AppColors.orangeMain),
          ('orange800', AppColors.orange800),
          ('orange700', AppColors.orange700),
          ('orange600', AppColors.orange600),
          ('orange500', AppColors.orange500),
          ('orange400', AppColors.orange400),
          ('orange300', AppColors.orange300),
          ('orange200', AppColors.orange200),
          ('orange100', AppColors.orange100),
        ]),
        _buildTokenGroup('Green Colors', [
          ('greenMain', AppColors.greenMain),
          ('green800', AppColors.green800),
          ('green700', AppColors.green700),
          ('green600', AppColors.green600),
          ('green500', AppColors.green500),
          ('green400', AppColors.green400),
          ('green300', AppColors.green300),
          ('green200', AppColors.green200),
          ('green100', AppColors.green100),
        ]),
      ],
    );
  }

  Widget _buildSpacingSection() {
    return _buildSection(
      'Spacing',
      [
        _buildTokenItem('spacing0', AppSpacing.spacing0.toString()),
        _buildTokenItem('spacing4', AppSpacing.spacing4.toString()),
        _buildTokenItem('spacing8', AppSpacing.spacing8.toString()),
        _buildTokenItem('spacing10', AppSpacing.spacing10.toString()),
        _buildTokenItem('spacing12', AppSpacing.spacing12.toString()),
        _buildTokenItem('spacing16', AppSpacing.spacing16.toString()),
        _buildTokenItem('spacing20', AppSpacing.spacing20.toString()),
        _buildTokenItem('spacing24', AppSpacing.spacing24.toString()),
        _buildTokenItem('spacing28', AppSpacing.spacing28.toString()),
        _buildTokenItem('spacing32', AppSpacing.spacing32.toString()),
        _buildTokenItem('spaceX1', AppSpacing.spaceX1.toString()),
        _buildTokenItem('spaceX2', AppSpacing.spaceX2.toString()),
        _buildTokenItem('spaceX3', AppSpacing.spaceX3.toString()),
        _buildTokenItem('spaceX4', AppSpacing.spaceX4.toString()),
        _buildTokenItem('spaceX5', AppSpacing.spaceX5.toString()),
        _buildTokenItem('spaceX6', AppSpacing.spaceX6.toString()),
      ],
    );
  }

  Widget _buildTypographySection() {
    return _buildSection(
      'Typography',
      [
        _buildTokenGroup('Font Family', [
          ('fontSans', AppTypography.fontSans),
        ]),
        _buildTokenGroup('Font Weights', [
          ('weightRegular', '${AppTypography.weightRegular.value}'),
          ('weightMedium', '${AppTypography.weightMedium.value}'),
          ('weightBold', '${AppTypography.weightBold.value}'),
        ]),
        _buildTokenGroup('Font Sizes', [
          ('size10', '${AppTypography.size10}px'),
          ('size12', '${AppTypography.size12}px'),
          ('size14', '${AppTypography.size14}px'),
          ('size16', '${AppTypography.size16}px'),
          ('size18', '${AppTypography.size18}px'),
          ('size20', '${AppTypography.size20}px'),
          ('size22', '${AppTypography.size22}px'),
          ('size24', '${AppTypography.size24}px'),
          ('size26', '${AppTypography.size26}px'),
          ('size28', '${AppTypography.size28}px'),
          ('size30', '${AppTypography.size30}px'),
          ('size32', '${AppTypography.size32}px'),
        ]),
      ],
    );
  }

  Widget _buildThemeTokensSection() {
    return _buildSection(
      'Theme Tokens',
      [
        _buildTokenGroup('Text Colors', [
          ('textPrimary', themeProvider.textPrimary),
          ('textSecondary', themeProvider.textSecondary),
          ('textDisabled', themeProvider.isDarkMode 
              ? AppThemeDarkTokens.textDisabled 
              : AppThemeLightTokens.textDisabled),
          ('textAccent', themeProvider.isDarkMode 
              ? AppThemeDarkTokens.textAccent 
              : AppThemeLightTokens.textAccent),
          ('textCritical', themeProvider.isDarkMode 
              ? AppThemeDarkTokens.textCritical 
              : AppThemeLightTokens.textCritical),
          ('textCaution', themeProvider.isDarkMode 
              ? AppThemeDarkTokens.textCaution 
              : AppThemeLightTokens.textCaution),
          ('textSuccess', themeProvider.isDarkMode 
              ? AppThemeDarkTokens.textSuccess 
              : AppThemeLightTokens.textSuccess),
        ]),
        _buildTokenGroup('Border Colors', [
          ('borderPrimary', themeProvider.borderPrimary),
          ('borderSecondary', themeProvider.isDarkMode 
              ? AppThemeDarkTokens.borderSecondary 
              : AppThemeLightTokens.borderSecondary),
        ]),
      ],
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStylesWeb.h2.copyWith(color: themeProvider.textPrimary),
        ),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }

  Widget _buildTokenGroup(String groupName, List<(String, dynamic)> tokens) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: themeProvider.backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: themeProvider.borderPrimary,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            groupName,
            style: AppTextStylesWeb.bodyBold.copyWith(
              color: themeProvider.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          ...tokens.map((token) => _buildTokenRow(token.$1, token.$2)),
        ],
      ),
    );
  }

  Widget _buildTokenItem(String name, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: themeProvider.backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: themeProvider.borderPrimary,
          width: 1,
        ),
      ),
      child: _buildTokenRow(name, value),
    );
  }

  Widget _buildTokenRow(String name, dynamic value) {
    String displayValue;
    Color? colorValue;

    if (value is Color) {
      colorValue = value;
      displayValue = _getColorHexWithAlpha(value);
    } else {
      displayValue = value.toString();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              name,
              style: AppTextStylesWeb.bodyRegular.copyWith(
                color: themeProvider.textPrimary,
              ),
            ),
          ),
          if (colorValue != null) ...[
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: colorValue,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: themeProvider.borderPrimary,
                  width: 1,
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
          Text(
            displayValue,
            style: AppTextStylesWeb.smallRegular.copyWith(
              color: themeProvider.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  String _getColorHexWithAlpha(Color color) {
    final value = color.value;
    final alpha = (value >> 24) & 0xFF;
    final red = (value >> 16) & 0xFF;
    final green = (value >> 8) & 0xFF;
    final blue = value & 0xFF;
    
    return '#${alpha.toRadixString(16).padLeft(2, '0').toUpperCase()}'
        '${red.toRadixString(16).padLeft(2, '0').toUpperCase()}'
        '${green.toRadixString(16).padLeft(2, '0').toUpperCase()}'
        '${blue.toRadixString(16).padLeft(2, '0').toUpperCase()}';
  }
}

