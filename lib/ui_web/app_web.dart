import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import 'pages/tokens_page.dart';
import 'pages/components_page.dart';
import 'widgets/navigation_sidebar.dart';

class AppWeb extends StatefulWidget {
  final AppThemeProvider themeProvider;

  const AppWeb({super.key, required this.themeProvider});

  @override
  State<AppWeb> createState() => _AppWebState();
}

class _AppWebState extends State<AppWeb> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onNavItemTap(int index) {
    if (index != _currentIndex) {
      _animationController.reset();
      setState(() {
        _currentIndex = index;
      });
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.themeProvider.backgroundColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: widget.themeProvider.isDarkMode
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    widget.themeProvider.backgroundColor,
                    widget.themeProvider.backgroundColor.withOpacity(0.95),
                  ],
                )
              : null,
        ),
        child: Row(
          children: [
            // Боковая панель навигации
            NavigationSidebar(
              themeProvider: widget.themeProvider,
              currentIndex: _currentIndex,
              onNavItemTap: _onNavItemTap,
            ),
            // Основной контент
            Expanded(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: IndexedStack(
                  index: _currentIndex,
                  children: [
                    TokensPage(themeProvider: widget.themeProvider),
                    ComponentsPage(themeProvider: widget.themeProvider),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

