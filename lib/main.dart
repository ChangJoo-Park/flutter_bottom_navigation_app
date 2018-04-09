import 'package:flutter/material.dart';

import "./pages/flat-page.dart";
import './pages/scrollable-page.dart';
import 'components/navigation-icon-view.dart';

void main() => runApp(
      new MaterialApp(
        theme: new ThemeData(
          primarySwatch: Colors.red,
        ),
        home: new BottomNavigationApp(),
      ),
    );

class BottomNavigationApp extends StatefulWidget {
  @override
  _BottomNavigationAppState createState() => new _BottomNavigationAppState();
}

class _BottomNavigationAppState extends State<BottomNavigationApp>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  BottomNavigationBarType _type = BottomNavigationBarType.fixed;
  List<NavigationIconView> _navigationViews;

  @override
  void initState() {
    super.initState();
    _navigationViews = <NavigationIconView>[
      new NavigationIconView(
        icon: const Icon(Icons.show_chart),
        title: 'Stats',
        page: new ScrollablePage(),
        vsync: this,
      ),
      new NavigationIconView(
        icon: const Icon(Icons.store_mall_directory),
        title: 'Overview',
        page: new FlatPage('Overview'),
        vsync: this,
      ),
      new NavigationIconView(
        icon: const Icon(Icons.book),
        title: 'Reservations',
        page: new FlatPage('Reservations'),
        vsync: this,
      ),
      new NavigationIconView(
        icon: const Icon(Icons.settings),
        title: 'Settings',
        page: new FlatPage('Settings'),
        vsync: this,
      ),
    ];

    for (NavigationIconView view in _navigationViews)
      view.controller.addListener(_rebuild);

    _navigationViews[_currentIndex].controller.value = 1.0;
  }

  @override
  void dispose() {
    for (NavigationIconView view in _navigationViews)
      view.controller.dispose();
    super.dispose();
  }

  void _rebuild() {
    setState(() {
      // Rebuild in order to animate views.
    });
  }

  Widget _buildTransitionsStack() {
    final List<FadeTransition> transitions = <FadeTransition>[];

    for (NavigationIconView view in _navigationViews) {
      transitions.add(view.transition(_type, context));
    }

    // We want to have the newly animating (fading in) views on top.
    transitions.sort((FadeTransition a, FadeTransition b) {
      final Animation<double> aAnimation = a.opacity;
      final Animation<double> bAnimation = b.opacity;
      final double aValue = aAnimation.value;
      final double bValue = bAnimation.value;
      return aValue.compareTo(bValue);
    });

    return new Stack(children: transitions);
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
      items: _navigationViews
          .map((NavigationIconView navigationView) => navigationView.item)
          .toList(),
      currentIndex: _currentIndex,
      type: _type,
      onTap: (int index) {
        setState(() {
          _navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          _navigationViews[_currentIndex].controller.forward();
        });
      },
    );

    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Bottom Navigation App'),
      ),
      body: new Center(child: _buildTransitionsStack()),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
