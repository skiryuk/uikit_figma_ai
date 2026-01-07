import 'package:flutter/cupertino.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/app_text_styles.dart';

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
        child: Text(
          'Typography Page',
          style: AppTextStyles.bodyRegular.copyWith(
            color: themeProvider.textPrimary,
          ),
        ),
      ),
    );
  }
}
