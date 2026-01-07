import 'package:flutter/cupertino.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_theme_tokens.dart';

class PalettePage extends StatelessWidget {
  final AppThemeProvider themeProvider;

  const PalettePage({super.key, required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: themeProvider.backgroundColor,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: themeProvider.backgroundColor,
        middle: Text(
          'Palette',
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
            if (!themeProvider.isDarkMode) ...[
              _buildColorSection(
                'Black Colors',
                [
                  ('Black Main', AppColors.blackMain),
                  ('Black 600', AppColors.black600),
                  ('Black 500', AppColors.black500),
                  ('Black 400', AppColors.black400),
                  ('Black 300', AppColors.black300),
                  ('Black 200', AppColors.black200),
                  ('Black 100', AppColors.black100),
                ],
              ),
              const SizedBox(height: 24),
            ],
            if (themeProvider.isDarkMode) ...[
              _buildColorSection(
                'White Colors',
                [
                  ('White Main', AppColors.whiteMain),
                  ('White 600', AppColors.white600),
                  ('White 500', AppColors.white500),
                  ('White 400', AppColors.white400),
                  ('White 300', AppColors.white300),
                  ('White 200', AppColors.white200),
                  ('White 100', AppColors.white100),
                ],
              ),
              const SizedBox(height: 24),
            ],
            const SizedBox(height: 24),
            _buildColorSection(
              'Blue Colors',
              [
                ('Blue Main', AppColors.blueMain),
                ('Blue 800', AppColors.blue800),
                ('Blue 700', AppColors.blue700),
                ('Blue 600', AppColors.blue600),
                ('Blue 500', AppColors.blue500),
                ('Blue 400', AppColors.blue400),
                ('Blue 300', AppColors.blue300),
                ('Blue 200', AppColors.blue200),
                ('Blue 100', AppColors.blue100),
              ],
            ),
            const SizedBox(height: 24),
            _buildColorSection(
              'Red Colors',
              [
                ('Red Main', AppColors.redMain),
                ('Red 800', AppColors.red800),
                ('Red 700', AppColors.red700),
                ('Red 600', AppColors.red600),
                ('Red 500', AppColors.red500),
                ('Red 400', AppColors.red400),
                ('Red 300', AppColors.red300),
                ('Red 200', AppColors.red200),
                ('Red 100', AppColors.red100),
              ],
            ),
            const SizedBox(height: 24),
            _buildColorSection(
              'Orange Colors',
              [
                ('Orange Main', AppColors.orangeMain),
                ('Orange 800', AppColors.orange800),
                ('Orange 700', AppColors.orange700),
                ('Orange 600', AppColors.orange600),
                ('Orange 500', AppColors.orange500),
                ('Orange 400', AppColors.orange400),
                ('Orange 300', AppColors.orange300),
                ('Orange 200', AppColors.orange200),
                ('Orange 100', AppColors.orange100),
              ],
            ),
            const SizedBox(height: 24),
            _buildColorSection(
              'Green Colors',
              [
                ('Green Main', AppColors.greenMain),
                ('Green 800', AppColors.green800),
                ('Green 700', AppColors.green700),
                ('Green 600', AppColors.green600),
                ('Green 500', AppColors.green500),
                ('Green 400', AppColors.green400),
                ('Green 300', AppColors.green300),
                ('Green 200', AppColors.green200),
                ('Green 100', AppColors.green100),
              ],
            ),
            const SizedBox(height: 24),
            _buildThemeTokensSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildColorSection(String title, List<(String, Color)> colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.h2.copyWith(color: themeProvider.textPrimary),
        ),
        const SizedBox(height: 12),
        ...colors.map((colorData) => _buildColorItem(
              colorData.$1,
              colorData.$2,
            )),
      ],
    );
  }

  Widget _buildColorItem(String name, Color color) {
    final isLight = color.computeLuminance() > 0.5;
    final textColor = isLight ? AppColors.blackMain : AppColors.whiteMain;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: themeProvider.borderPrimary,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: themeProvider.borderPrimary,
                  width: 1,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTextStyles.bodyMedium.copyWith(color: textColor),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _getColorHexWithAlpha(color),
                    style: AppTextStyles.smallRegular.copyWith(color: textColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeTokensSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Theme Tokens',
          style: AppTextStyles.h2.copyWith(color: themeProvider.textPrimary),
        ),
        const SizedBox(height: 12),
        _buildThemeTokenCategory('Text Colors', [
          ('Primary', themeProvider.textPrimary),
          ('Secondary', themeProvider.textSecondary),
          ('Disabled', themeProvider.isDarkMode 
              ? AppThemeDarkTokens.textDisabled 
              : AppThemeLightTokens.textDisabled),
          ('Accent', themeProvider.isDarkMode 
              ? AppThemeDarkTokens.textAccent 
              : AppThemeLightTokens.textAccent),
          ('Critical', themeProvider.isDarkMode 
              ? AppThemeDarkTokens.textCritical 
              : AppThemeLightTokens.textCritical),
          ('Caution', themeProvider.isDarkMode 
              ? AppThemeDarkTokens.textCaution 
              : AppThemeLightTokens.textCaution),
          ('Success', themeProvider.isDarkMode 
              ? AppThemeDarkTokens.textSuccess 
              : AppThemeLightTokens.textSuccess),
        ]),
        const SizedBox(height: 16),
        _buildThemeTokenCategory('Border Colors', [
          ('Primary', themeProvider.borderPrimary),
          ('Secondary', themeProvider.isDarkMode 
              ? AppThemeDarkTokens.borderSecondary 
              : AppThemeLightTokens.borderSecondary),
        ]),
      ],
    );
  }

  Widget _buildThemeTokenCategory(
    String categoryName,
    List<(String, Color)> tokens,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          categoryName,
          style: AppTextStyles.bodyBold.copyWith(
            color: themeProvider.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        ...tokens.map((token) => _buildColorItem(token.$1, token.$2)),
      ],
    );
  }

  /// Получить hex-код цвета с альфа-каналом в формате #AARRGGBB
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
