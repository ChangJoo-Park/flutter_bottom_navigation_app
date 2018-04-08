import 'package:flutter/material.dart';

import "./pages/flat-page.dart";
import "./pages/scrollable-page.dart";

void main() => runApp(
      new MaterialApp(
        theme: new ThemeData(
          primarySwatch: Colors.red,
        ),
        home: new HomePage(),
      ),
    );

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<Widget> tabPages = [
    new ScrollablePage(),
    new FlatPage("Second"),
    new FlatPage("Third"),
  ];
  List<Widget> tabList = [
    new Tab(
      icon: new Icon(Icons.favorite),
    ),
    new Tab(
      icon: new Icon(Icons.email),
    ),
    new Tab(
      icon: new Icon(Icons.laptop),
    ),
  ];

  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(
      length: tabPages.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BottomAppBar"),
      ),
      body: new TabBarView(
        controller: tabController,
        children: tabPages,
      ),
      bottomNavigationBar: new Material(
        color: Colors.red,
        child: new TabBar(
          controller: tabController,
          tabs: tabList,
        ),
      ),
    );
  }
}
