import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../core/theme/app_text_styles_web.dart';
import 'pages/tokens_page.dart';
import 'pages/components_page.dart';

class AppWeb extends StatefulWidget {
  final AppThemeProvider themeProvider;

  const AppWeb({super.key, required this.themeProvider});

  @override
  State<AppWeb> createState() => _AppWebState();
}

class _AppWebState extends State<AppWeb> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.themeProvider.backgroundColor,
      appBar: AppBar(
        backgroundColor: widget.themeProvider.backgroundColor,
        elevation: 0,
        title: Text(
          'Design System',
          style: AppTextStylesWeb.h2.copyWith(
            color: widget.themeProvider.textPrimary,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              widget.themeProvider.isDarkMode 
                  ? Icons.light_mode 
                  : Icons.dark_mode,
              color: widget.themeProvider.textPrimary,
            ),
            onPressed: () => widget.themeProvider.toggleTheme(),
            tooltip: 'Переключить тему',
          ),
        ],
      ),
      body: Row(
        children: [
          // Боковая панель навигации
          Container(
            width: 250,
            decoration: BoxDecoration(
              color: widget.themeProvider.backgroundColor,
              border: Border(
                right: BorderSide(
                  color: widget.themeProvider.borderPrimary,
                  width: 1,
                ),
              ),
            ),
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              children: [
                _NavItem(
                  icon: Icons.palette_outlined,
                  label: 'Design Tokens',
                  isSelected: _currentIndex == 0,
                  onTap: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                  themeProvider: widget.themeProvider,
                ),
                _NavItem(
                  icon: Icons.widgets_outlined,
                  label: 'Components',
                  isSelected: _currentIndex == 1,
                  onTap: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                  },
                  themeProvider: widget.themeProvider,
                ),
              ],
            ),
          ),
          // Основной контент
          Expanded(
            child: IndexedStack(
              index: _currentIndex,
              children: [
                TokensPage(themeProvider: widget.themeProvider),
                ComponentsPage(themeProvider: widget.themeProvider),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final AppThemeProvider themeProvider;

  const _NavItem({
    required this.icon,
    required this.label,
    this.isSelected = false,
    required this.onTap,
    required this.themeProvider,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: isSelected 
            ? themeProvider.borderPrimary.withOpacity(0.1)
            : Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected 
                  ? themeProvider.textPrimary
                  : themeProvider.textSecondary,
              size: 20,
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: AppTextStylesWeb.bodyRegular.copyWith(
                color: isSelected 
                    ? themeProvider.textPrimary
                    : themeProvider.textSecondary,
                fontWeight: isSelected 
                    ? FontWeight.w500
                    : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

