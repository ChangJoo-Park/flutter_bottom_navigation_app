import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
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
        children: <Widget>[
          new NewPage("First"),
          new NewPage("Second"),
          new NewPage("Third"),
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.red,
        child: new TabBar(
          controller: tabController,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.favorite),
              child: new Text('Favorite'),
            ),
            new Tab(
              icon: new Icon(Icons.email),
              child: new Text('Email'),
            ),
            new Tab(
              icon: new Icon(Icons.laptop),
              child: new Text('Laptop'),
            ),
          ],
        ),
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  final String title;

  NewPage(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(body: new Center(child: new Text(title)));
  }
}
