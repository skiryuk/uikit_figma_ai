import 'package:flutter/cupertino.dart';
import '../typography/typography.dart';
import '../palette/palette.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.textformat),
            label: 'Typography',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.paintbrush),
            label: 'Palette',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return const TypographyPage();
          case 1:
            return const PalettePage();
          default:
            return const TypographyPage();
        }
      },
    );
  }
}
