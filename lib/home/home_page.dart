import 'package:bottom_nav_example/color/color_swatch_page.dart';
import 'package:bottom_nav_example/home/page_switcher.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () async {
        return !await _navigatorKeys[_pageIndex].currentState.maybePop();
      },
      child: Container(
        color: theme.scaffoldBackgroundColor,
        child: Column(
          children: <Widget>[
            _body(),
            _bottomNavigationBar(),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return Expanded(
      child: PageSwitcher(
        index: _pageIndex,
        children: [
          _PageFactory.materialColorPage(
            _navigatorKeys[0],
            'Red',
            Colors.red,
          ),
          _PageFactory.materialColorPage(
            _navigatorKeys[1],
            'Green',
            Colors.green,
          ),
          _PageFactory.materialAccentColorPage(
            _navigatorKeys[2],
            'Blue Accent',
            Colors.blueAccent,
          ),
        ],
      ),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return new BottomNavigationBar(
      currentIndex: _pageIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.color_lens_rounded,
          ),
          label: 'Red',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.color_lens_rounded,
          ),
          label: 'Green',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.color_lens_rounded,
          ),
          label: 'Blue Accent',
        ),
      ],
      onTap: (int index) {
        setState(() {
          _pageIndex = index;
        });
      },
    );
  }
}

class _PageFactory {
  static Widget materialColorPage(
    GlobalKey<NavigatorState> navKey,
    String title,
    MaterialColor color,
  ) {
    return colorSwatchPage(
      navKey: navKey,
      title: title,
      colorSwatch: color,
      shades: [50, 100, 200, 300, 400, 500, 600, 700, 800, 900],
    );
  }

  static Widget materialAccentColorPage(
    GlobalKey<NavigatorState> navKey,
    String title,
    MaterialAccentColor color,
  ) {
    return colorSwatchPage(
      navKey: navKey,
      title: title,
      colorSwatch: color,
      shades: [100, 200, 400, 700],
    );
  }

  static Widget colorSwatchPage({
    GlobalKey<NavigatorState> navKey,
    String title,
    ColorSwatch<int> colorSwatch,
    List<int> shades,
  }) {
    return Navigator(
      key: navKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (_) {
            return ColorSwatchPage(
              name: title,
              colorSwatch: colorSwatch,
              shades: shades,
            );
          },
          settings: settings,
        );
      },
    );
  }
}
