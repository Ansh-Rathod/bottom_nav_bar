import 'package:flutter/material.dart';

import 'persistent-tab-view.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavView(),
    );
  }
}

class BottomNavView extends StatefulWidget {
  @override
  _BottomNavViewState createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Container(),
    Container(),
    Container(),
    Container(),
  ];
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        inactiveColorPrimary: Colors.grey,
        iconSize: 30,
        icon: Icon(
          Icons.home,
          size: 30,
        ),
        activeColorPrimary: Colors.cyanAccent,
        title: ("Home"),
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: Colors.grey,
        iconSize: 30,
        icon: Icon(
          Icons.search,
          size: 30,
        ),
        activeColorPrimary: Colors.cyanAccent,
        title: ("Search"),
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: Colors.grey,
        icon: Icon(
          Icons.favorite,
          size: 30,
        ),
        iconSize: 30,
        activeColorPrimary: Colors.cyanAccent,
        title: ("Activity"),
      ),
      PersistentBottomNavBarItem(
        inactiveColorPrimary: Colors.grey,
        icon: Icon(
          Icons.list,
          size: 30,
        ),
        iconSize: 30,
        activeColorPrimary: Colors.cyanAccent,
        title: ("More"),
      ),
    ];
  }

  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
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
