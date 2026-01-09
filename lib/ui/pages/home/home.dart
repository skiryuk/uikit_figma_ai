import 'package:flutter/cupertino.dart';
import '../../../core/theme/app_theme.dart';
import '../typography/typography.dart';
import '../palette/palette.dart';
import '../buttons/buttons.dart';

class HomePage extends StatelessWidget {
  final AppThemeProvider themeProvider;

  const HomePage({super.key, required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.paintbrush),
            label: 'Palette',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.textformat),
            label: 'Typography',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_grid_2x2),
            label: 'Buttons',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return PalettePage(themeProvider: themeProvider);
          case 1:
            return TypographyPage(themeProvider: themeProvider);
          case 2:
            return ButtonsPage(themeProvider: themeProvider);
          default:
            return PalettePage(themeProvider: themeProvider);
        }
      },
    );
  }
}
