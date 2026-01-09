import 'package:flutter/cupertino.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/app_spacing.dart';

class TypographyPage extends StatelessWidget {
  final AppThemeProvider themeProvider;

  const TypographyPage({super.key, required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: themeProvider.backgroundColor,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: themeProvider.backgroundColor,
        middle: Text(
          'Typography',
          style: AppTextStyles.h2.copyWith(color: themeProvider.textPrimary),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => themeProvider.toggleTheme(),
          child: Icon(
            themeProvider.isDarkMode 
                ? CupertinoIcons.sun_max 
                : CupertinoIcons.moon,
            color: themeProvider.textPrimary,
          ),
        ),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildTypographySection(
              'Headings',
              [
                _TypographyStyleData(
                  name: 'H1',
                  style: AppTextStyles.h1,
                  example: 'Heading 1',
                  fontSize: AppTypography.size30,
                  fontWeight: AppTypography.weightBold,
                  lineHeight: 32.0,
                  letterSpacing: 0.0,
                ),
                _TypographyStyleData(
                  name: 'H2',
                  style: AppTextStyles.h2,
                  example: 'Heading 2',
                  fontSize: AppTypography.size24,
                  fontWeight: AppTypography.weightBold,
                  lineHeight: 32.0,
                  letterSpacing: 0.0,
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildTypographySection(
              'Large',
              [
                _TypographyStyleData(
                  name: 'Large',
                  style: AppTextStyles.large,
                  example: 'Large Text',
                  fontSize: AppTypography.size22,
                  fontWeight: AppTypography.weightMedium,
                  lineHeight: 24.0,
                  letterSpacing: 0.0,
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildTypographySection(
              'Body',
              [
                _TypographyStyleData(
                  name: 'Body / Regular',
                  style: AppTextStyles.bodyRegular,
                  example: 'Body text with regular weight',
                  fontSize: AppTypography.size18,
                  fontWeight: AppTypography.weightRegular,
                  lineHeight: 24.0,
                  letterSpacing: 0.0,
                ),
                _TypographyStyleData(
                  name: 'Body / Medium',
                  style: AppTextStyles.bodyMedium,
                  example: 'Body text with medium weight',
                  fontSize: AppTypography.size18,
                  fontWeight: AppTypography.weightMedium,
                  lineHeight: 24.0,
                  letterSpacing: 0.0,
                ),
                _TypographyStyleData(
                  name: 'Body / Bold',
                  style: AppTextStyles.bodyBold,
                  example: 'Body text with bold weight',
                  fontSize: AppTypography.size18,
                  fontWeight: AppTypography.weightBold,
                  lineHeight: 24.0,
                  letterSpacing: 0.0,
                ),
                _TypographyStyleData(
                  name: 'Body / Monospace',
                  style: AppTextStyles.bodyMonospace,
                  example: '1234567890',
                  fontSize: AppTypography.size18,
                  fontWeight: AppTypography.weightRegular,
                  lineHeight: 24.0,
                  letterSpacing: 0.0,
                  isMonospace: true,
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildTypographySection(
              'Small',
              [
                _TypographyStyleData(
                  name: 'Small / Regular',
                  style: AppTextStyles.smallRegular,
                  example: 'Small text with regular weight',
                  fontSize: AppTypography.size14,
                  fontWeight: AppTypography.weightRegular,
                  lineHeight: 16.0,
                  letterSpacing: 0.14,
                ),
                _TypographyStyleData(
                  name: 'Small / Medium',
                  style: AppTextStyles.smallMedium,
                  example: 'Small text with medium weight',
                  fontSize: AppTypography.size14,
                  fontWeight: AppTypography.weightMedium,
                  lineHeight: 16.0,
                  letterSpacing: 0.14,
                ),
                _TypographyStyleData(
                  name: 'Small / Monospace',
                  style: AppTextStyles.smallMonospace,
                  example: '1234567890',
                  fontSize: AppTypography.size14,
                  fontWeight: AppTypography.weightMedium,
                  lineHeight: 16.0,
                  letterSpacing: 0.14,
                  isMonospace: true,
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildFontInfoSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildTypographySection(
    String title,
    List<_TypographyStyleData> styles,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.h2.copyWith(color: themeProvider.textPrimary),
        ),
        const SizedBox(height: 12),
        ...styles.map((styleData) => _buildTypographyItem(styleData)),
      ],
    );
  }

  Widget _buildTypographyItem(_TypographyStyleData styleData) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.spacing16),
      padding: const EdgeInsets.all(AppSpacing.spacing16),
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
          // Пример текста
          Text(
            styleData.example,
            style: styleData.style.copyWith(
              color: themeProvider.textPrimary,
            ),
          ),
          const SizedBox(height: AppSpacing.spacing12),
          // Информация о стиле
          _buildStyleInfo(styleData),
        ],
      ),
    );
  }

  Widget _buildStyleInfo(_TypographyStyleData styleData) {
    final fontWeightName = _getFontWeightName(styleData.fontWeight);
    final letterSpacingText = styleData.letterSpacing == 0.0 
        ? '0' 
        : styleData.letterSpacing.toStringAsFixed(2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          styleData.name,
          style: AppTextStyles.bodyBold.copyWith(
            color: themeProvider.textSecondary,
          ),
        ),
        const SizedBox(height: AppSpacing.spacing4),
        Text(
          'Family: ${AppTypography.fontSans}',
          style: AppTextStyles.smallRegular.copyWith(
            color: themeProvider.textSecondary,
          ),
        ),
        Text(
          'Weight: $fontWeightName (${styleData.fontWeight.value})',
          style: AppTextStyles.smallRegular.copyWith(
            color: themeProvider.textSecondary,
          ),
        ),
        Text(
          'Size: ${styleData.fontSize.toInt()}px',
          style: AppTextStyles.smallRegular.copyWith(
            color: themeProvider.textSecondary,
          ),
        ),
        Text(
          'Line Height: ${styleData.lineHeight.toInt()}px',
          style: AppTextStyles.smallRegular.copyWith(
            color: themeProvider.textSecondary,
          ),
        ),
        Text(
          'Letter Spacing: $letterSpacingText',
          style: AppTextStyles.smallRegular.copyWith(
            color: themeProvider.textSecondary,
          ),
        ),
        if (styleData.isMonospace)
          Text(
            'Monospace: For numeric data alignment',
            style: AppTextStyles.smallRegular.copyWith(
              color: themeProvider.textSecondary,
            ),
          ),
      ],
    );
  }

  Widget _buildFontInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Font Information',
          style: AppTextStyles.h2.copyWith(color: themeProvider.textPrimary),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(AppSpacing.spacing16),
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
                'Font Family',
                style: AppTextStyles.bodyBold.copyWith(
                  color: themeProvider.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                AppTypography.fontSans,
                style: AppTextStyles.bodyRegular.copyWith(
                  color: themeProvider.textSecondary,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Available Weights',
                style: AppTextStyles.bodyBold.copyWith(
                  color: themeProvider.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Regular (${AppTypography.weightRegular.value})',
                style: AppTextStyles.bodyRegular.copyWith(
                  color: themeProvider.textSecondary,
                ),
              ),
              Text(
                'Medium (${AppTypography.weightMedium.value})',
                style: AppTextStyles.bodyRegular.copyWith(
                  color: themeProvider.textSecondary,
                ),
              ),
              Text(
                'Bold (${AppTypography.weightBold.value})',
                style: AppTextStyles.bodyRegular.copyWith(
                  color: themeProvider.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _getFontWeightName(FontWeight weight) {
    switch (weight.value) {
      case 400:
        return 'Regular';
      case 500:
        return 'Medium';
      case 700:
        return 'Bold';
      default:
        return 'Weight ${weight.value}';
    }
  }
}

/// Данные о текстовом стиле для демонстрации
class _TypographyStyleData {
  final String name;
  final TextStyle style;
  final String example;
  final double fontSize;
  final FontWeight fontWeight;
  final double lineHeight;
  final double letterSpacing;
  final bool isMonospace;

  _TypographyStyleData({
    required this.name,
    required this.style,
    required this.example,
    required this.fontSize,
    required this.fontWeight,
    required this.lineHeight,
    required this.letterSpacing,
    this.isMonospace = false,
  });
}
