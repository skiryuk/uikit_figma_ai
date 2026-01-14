import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/app_text_styles_web.dart';

/// Боковая панель навигации приложения
class NavigationSidebar extends StatelessWidget {
  final AppThemeProvider themeProvider;
  final int currentIndex;
  final ValueChanged<int> onNavItemTap;

  const NavigationSidebar({
    super.key,
    required this.themeProvider,
    required this.currentIndex,
    required this.onNavItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: themeProvider.isDarkMode
            ? themeProvider.surfaceNeutralMedium
            : themeProvider.backgroundColor,
        border: Border(
          right: BorderSide(
            color: themeProvider.borderPrimary.withOpacity(0.1),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(
              themeProvider.isDarkMode ? 0.3 : 0.05,
            ),
            blurRadius: 10,
            offset: const Offset(2, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          // Заголовок
          _buildHeader(),
          // Навигация
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              children: [
                NavigationItem(
                  icon: Icons.palette_outlined,
                  label: 'Дизайн-токены',
                  isSelected: currentIndex == 0,
                  onTap: () => onNavItemTap(0),
                  themeProvider: themeProvider,
                ),
                const SizedBox(height: 4),
                NavigationItem(
                  icon: Icons.widgets_outlined,
                  label: 'Компоненты',
                  isSelected: currentIndex == 1,
                  onTap: () => onNavItemTap(1),
                  themeProvider: themeProvider,
                ),
              ],
            ),
          ),
          // Переключатель темы
          _buildThemeToggle(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: themeProvider.borderPrimary.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF454DE7),
                  Color(0xFF6B73FF),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.palette,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Design System',
                  style: AppTextStylesWeb.h2.copyWith(
                    color: themeProvider.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'UIKit AI',
                  style: AppTextStylesWeb.smallRegular.copyWith(
                    color: themeProvider.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThemeToggle() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: themeProvider.borderPrimary.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: InkWell(
        onTap: () => themeProvider.toggleTheme(),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: themeProvider.surfaceNeutralLow,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: themeProvider.borderPrimary.withOpacity(0.1),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                themeProvider.isDarkMode
                    ? Icons.light_mode
                    : Icons.dark_mode,
                color: themeProvider.textPrimary,
                size: 20,
              ),
              const SizedBox(width: 12),
              Text(
                themeProvider.isDarkMode
                    ? 'Светлая тема'
                    : 'Темная тема',
                style: AppTextStylesWeb.bodyRegular.copyWith(
                  color: themeProvider.textPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Элемент навигации в боковой панели
class NavigationItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final AppThemeProvider themeProvider;

  const NavigationItem({
    super.key,
    required this.icon,
    required this.label,
    this.isSelected = false,
    required this.onTap,
    required this.themeProvider,
  });

  @override
  State<NavigationItem> createState() => _NavigationItemState();
}

class _NavigationItemState extends State<NavigationItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.98).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: MouseRegion(
            onEnter: (_) {
              setState(() => _isHovered = true);
              _controller.forward();
            },
            onExit: (_) {
              setState(() => _isHovered = false);
              _controller.reverse();
            },
            child: InkWell(
              onTap: widget.onTap,
              borderRadius: BorderRadius.circular(12),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: widget.isSelected
                      ? widget.themeProvider.isDarkMode
                          ? const Color(0xFF454DE7).withOpacity(0.15)
                          : const Color(0xFF454DE7).withOpacity(0.1)
                      : _isHovered
                          ? widget.themeProvider.surfaceNeutralLow
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: widget.isSelected
                      ? Border.all(
                          color: const Color(0xFF454DE7).withOpacity(0.3),
                          width: 1,
                        )
                      : null,
                ),
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: widget.isSelected
                            ? const Color(0xFF454DE7)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        widget.icon,
                        color: widget.isSelected
                            ? Colors.white
                            : widget.isSelected
                                ? widget.themeProvider.textPrimary
                                : widget.themeProvider.textSecondary,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        widget.label,
                        style: AppTextStylesWeb.bodyRegular.copyWith(
                          color: widget.isSelected
                              ? widget.themeProvider.textPrimary
                              : widget.themeProvider.textSecondary,
                          fontWeight: widget.isSelected
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                    if (widget.isSelected)
                      Icon(
                        Icons.chevron_right,
                        color: const Color(0xFF454DE7),
                        size: 20,
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

