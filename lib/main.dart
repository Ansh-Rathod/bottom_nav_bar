import 'package:bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SuperHeroDb',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BottomNavView());
  }
}

class BottomNavView extends StatefulWidget {
  @override
  _BottomNavViewState createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  late PersistentTabController _controller;

  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Scaffold(
      body: Center(
        child: Text("Home"),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text("Home"),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text("Home"),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text("Home"),
      ),
    ),
  ];
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        inactiveColorPrimary: Colors.grey,
        iconSize: 26,
        icon: Icon(
          Icons.home,
        ),
        activeColorPrimary: Colors.cyanAccent,
        title: ("Home"),
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: Colors.grey,
        iconSize: 28,
        icon: Icon(
          Icons.search,
        ),
        activeColorPrimary: Colors.cyanAccent,
        title: ("Search"),
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: Colors.grey,
        icon: Icon(
          Icons.favorite,
        ),
        iconSize: 26,
        activeColorPrimary: Colors.cyanAccent,
        title: ("Activity"),
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: Colors.grey,
        icon: Icon(
          Icons.list,
        ),
        iconSize: 26,
        activeColorPrimary: Colors.cyanAccent,
        title: ("More"),
      ),
    ];
  }

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PersistentTabView(
        this.context,
        controller: _controller,
        screens: _widgetOptions,
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.black,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: true,
        navBarStyle: NavBarStyle.style6,
      ),
    );
  }
}
