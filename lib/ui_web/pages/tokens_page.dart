import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../../core/theme/app_text_styles_web.dart';
import '../../core/theme/app_theme_tokens.dart';

class TokensPage extends StatefulWidget {
  final AppThemeProvider themeProvider;

  const TokensPage({super.key, required this.themeProvider});

  @override
  State<TokensPage> createState() => _TokensPageState();
}

class _TokensPageState extends State<TokensPage> {
  final Map<String, bool> _expandedGroups = {};

  @override
  void initState() {
    super.initState();
    // По умолчанию все группы развернуты
    _expandedGroups['Black Colors'] = true;
    _expandedGroups['White Colors'] = true;
    _expandedGroups['Blue Colors'] = true;
    _expandedGroups['Red Colors'] = true;
    _expandedGroups['Orange Colors'] = true;
    _expandedGroups['Green Colors'] = true;
    _expandedGroups['Font Family'] = true;
    _expandedGroups['Font Weights'] = true;
    _expandedGroups['Font Sizes'] = true;
    _expandedGroups['Text Colors'] = true;
    _expandedGroups['Border Colors'] = true;
  }

  bool _isExpanded(String groupName) {
    return _expandedGroups[groupName] ?? true;
  }

  void _toggleGroup(String groupName) {
    setState(() {
      _expandedGroups[groupName] = !(_expandedGroups[groupName] ?? true);
    });
  }

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
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок страницы
            _buildPageHeader(),
            const SizedBox(height: 40),
            _buildColorsSection(),
            const SizedBox(height: 48),
            _buildSpacingSection(),
            const SizedBox(height: 48),
            _buildTypographySection(),
            const SizedBox(height: 48),
            _buildThemeTokensSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildPageHeader() {
    return Text(
      'Дизайн-токены',
      style: AppTextStylesWeb.h1.copyWith(
        color: widget.themeProvider.textPrimary,
        fontSize: 36,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildColorsSection() {
    final isDarkMode = widget.themeProvider.isDarkMode;
    
    return _buildSection(
      'Палитра',
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
      'Отступы',
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
      'Шрифты',
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
      'Токены',
      [
        _buildTokenGroup('Text Colors', [
          ('textPrimary', widget.themeProvider.textPrimary),
          ('textSecondary', widget.themeProvider.textSecondary),
          ('textDisabled', widget.themeProvider.isDarkMode 
              ? AppThemeDarkTokens.textDisabled 
              : AppThemeLightTokens.textDisabled),
          ('textAccent', widget.themeProvider.isDarkMode 
              ? AppThemeDarkTokens.textAccent 
              : AppThemeLightTokens.textAccent),
          ('textCritical', widget.themeProvider.isDarkMode 
              ? AppThemeDarkTokens.textCritical 
              : AppThemeLightTokens.textCritical),
          ('textCaution', widget.themeProvider.isDarkMode 
              ? AppThemeDarkTokens.textCaution 
              : AppThemeLightTokens.textCaution),
          ('textSuccess', widget.themeProvider.isDarkMode 
              ? AppThemeDarkTokens.textSuccess 
              : AppThemeLightTokens.textSuccess),
        ]),
        _buildTokenGroup('Border Colors', [
          ('borderPrimary', widget.themeProvider.borderPrimary),
          ('borderSecondary', widget.themeProvider.isDarkMode 
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
        Container(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            children: [
              Container(
                width: 4,
                height: 24,
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
              Text(
                title,
                style: AppTextStylesWeb.h2.copyWith(
                  color: widget.themeProvider.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        ...children,
      ],
    );
  }

  Widget _buildTokenGroup(String groupName, List<(String, dynamic)> tokens) {
    final isExpanded = _isExpanded(groupName);
    
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: widget.themeProvider.isDarkMode
            ? widget.themeProvider.surfaceNeutralHigh
            : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: widget.themeProvider.borderPrimary.withOpacity(0.15),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(widget.themeProvider.isDarkMode ? 0.4 : 0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => _toggleGroup(groupName),
            borderRadius: isExpanded
                ? const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  )
                : BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: isExpanded
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      )
                    : BorderRadius.circular(16),
                border: isExpanded
                    ? Border(
                        bottom: BorderSide(
                          color: widget.themeProvider.borderPrimary.withOpacity(0.1),
                          width: 1,
                        ),
                      )
                    : null,
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF454DE7).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      groupName,
                      style: AppTextStylesWeb.bodyBold.copyWith(
                        color: const Color(0xFF454DE7),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const Spacer(),
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: widget.themeProvider.isDarkMode
                          ? AppColors.blackMain
                          : widget.themeProvider.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: isExpanded
                ? Padding(
                    padding: const EdgeInsets.all(20),
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: tokens.map((token) => _buildTokenCard(token.$1, token.$2)).toList(),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildTokenItem(String name, String value) {
    // Пытаемся извлечь числовое значение для визуализации отступа
    final spacingMatch = RegExp(r'(\d+(?:\.\d+)?)').firstMatch(value);
    double? spacingValue;
    if (spacingMatch != null) {
      spacingValue = double.tryParse(spacingMatch.group(1) ?? '');
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: widget.themeProvider.isDarkMode
            ? widget.themeProvider.surfaceNeutralHigh
            : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: widget.themeProvider.borderPrimary.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(widget.themeProvider.isDarkMode ? 0.2 : 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildTokenRow(name, value),
          ),
          if (spacingValue != null && spacingValue > 0) ...[
            const SizedBox(width: 16),
            Container(
              width: spacingValue.clamp(0.0, 200.0),
              height: 24,
              decoration: BoxDecoration(
                color: const Color(0xFF454DE7).withOpacity(0.2),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: const Color(0xFF454DE7).withOpacity(0.4),
                  width: 1,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTokenCard(String name, dynamic value) {
    String displayValue;
    Color? colorValue;

    if (value is Color) {
      colorValue = value;
      displayValue = _getColorHexWithAlpha(value);
    } else {
      displayValue = value.toString();
    }

    // Определяем, нужна ли контрастная граница для светлых цветов
    final isLightColor = colorValue != null && 
        (colorValue.computeLuminance() > 0.5 || 
         (colorValue.alpha < 255 && colorValue.computeLuminance() > 0.3));

    return Container(
      width: 180,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: widget.themeProvider.isDarkMode
            ? widget.themeProvider.surfaceNeutralHigh
            : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: widget.themeProvider.borderPrimary.withOpacity(0.15),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(widget.themeProvider.isDarkMode ? 0.4 : 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (colorValue != null) ...[
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: colorValue,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isLightColor 
                      ? Colors.black.withOpacity(0.15)
                      : widget.themeProvider.borderPrimary.withOpacity(0.2),
                  width: isLightColor ? 2 : 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
          ],
          Text(
            name,
            style: AppTextStylesWeb.bodyMedium.copyWith(
              color: widget.themeProvider.isDarkMode
                  ? Colors.black
                  : widget.themeProvider.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: widget.themeProvider.isDarkMode
                  ? widget.themeProvider.surfaceNeutralMedium
                  : widget.themeProvider.surfaceNeutralLow,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              displayValue,
              style: AppTextStylesWeb.smallRegular.copyWith(
                color: widget.themeProvider.isDarkMode
                    ? Colors.black87
                    : widget.themeProvider.textSecondary,
                fontFamily: 'Roboto Mono',
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
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

    // Определяем, нужна ли контрастная граница для светлых цветов
    final isLightColor = colorValue != null && 
        (colorValue.computeLuminance() > 0.5 || 
         (colorValue.alpha < 255 && colorValue.computeLuminance() > 0.3));

    return Row(
      children: [
        Expanded(
          child: Text(
            name,
            style: AppTextStylesWeb.bodyRegular.copyWith(
              color: widget.themeProvider.isDarkMode
                  ? Colors.black
                  : widget.themeProvider.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        if (colorValue != null) ...[
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colorValue,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isLightColor 
                    ? Colors.black.withOpacity(0.3)
                    : widget.themeProvider.borderPrimary.withOpacity(0.3),
                width: isLightColor ? 2 : 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
        ],
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: widget.themeProvider.isDarkMode
                ? widget.themeProvider.surfaceNeutralMedium
                : widget.themeProvider.surfaceNeutralLow,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: widget.themeProvider.borderPrimary.withOpacity(0.1),
              width: 1,
            ),
          ),
          child: Text(
            displayValue,
            style: AppTextStylesWeb.smallRegular.copyWith(
              color: widget.themeProvider.textSecondary,
              fontFamily: 'Roboto Mono',
              fontSize: 12,
            ),
          ),
        ),
      ],
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

