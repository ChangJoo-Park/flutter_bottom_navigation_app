import 'dart:async';

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
    tabController = new TabController(
      length: 3,
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
        children: <Widget>[
          new ScrollablePage(),
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
            ),
            new Tab(
              icon: new Icon(Icons.email),
            ),
            new Tab(
              icon: new Icon(Icons.laptop),
            ),
          ],
        ),
      ),
    );
  }
}

class ScrollablePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    Future<Null> _handleRefresh() {
      final Completer<Null> completer = new Completer<Null>();
      new Timer(const Duration(seconds: 1), () {
        completer.complete(null);
      });
      return completer.future.then((_) {
        _scaffoldKey.currentState?.showSnackBar(
          new SnackBar(
            content: const Text('Refresh complete'),
            action: new SnackBarAction(
              label: 'RETRY',
              onPressed: () {
                _refreshIndicatorKey.currentState.show();
              },
            ),
          ),
        );
      });
    }

    return new Scaffold(
      body: new RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        child: new ListView(
          children: <Widget>[
            new ListLabel('LIST LABEL'),
            new ListTile(
              leading: new Icon(Icons.map),
              title: new Text('Map'),
              onTap: () => print('hello'),
            ),
            new ListTile(
              leading: new Icon(Icons.photo_album),
              title: new Text('Album'),
            ),
            new ListTile(
              leading: new Icon(Icons.phone),
              title: new Text('Phone'),
            ),
            new ListTile(
              leading: new Icon(Icons.map),
              title: new Text('Map'),
            ),
            new ListTile(
              leading: new Icon(Icons.photo_album),
              title: new Text('Album'),
            ),
            new ListLabel('TESTING'),
            new ListTile(
              leading: new Icon(Icons.phone),
              title: new Text('Phone'),
            ),
            new ListTile(
              leading: new Icon(Icons.map),
              title: new Text('Map'),
            ),
            new ListTile(
              leading: new Icon(Icons.photo_album),
              title: new Text('Album'),
            ),
            new ListTile(
              leading: new Icon(Icons.phone),
              title: new Text('Phone'),
            ),
            new ListTile(
              leading: new Icon(Icons.map),
              title: new Text('Map'),
            ),
            new ListTile(
              leading: new Icon(Icons.photo_album),
              title: new Text('Album'),
            ),
            new ListTile(
              leading: new Icon(Icons.phone),
              title: new Text('Phone'),
            ),
            new ListTile(
              leading: new Icon(Icons.map),
              title: new Text('Map'),
            ),
            new ListTile(
              leading: new Icon(Icons.photo_album),
              title: new Text('Album'),
            ),
            new ListTile(
              leading: new Icon(Icons.phone),
              title: new Text('Phone'),
            ),
            new ListTile(
              leading: new Icon(Icons.map),
              title: new Text('Map'),
            ),
            new ListTile(
              leading: new Icon(Icons.photo_album),
              title: new Text('Album'),
            ),
            new ListTile(
              leading: new Icon(Icons.phone),
              title: new Text('Phone'),
            ),
            new ListTile(
              leading: new Icon(Icons.map),
              title: new Text('Map'),
            ),
            new ListTile(
              leading: new Icon(Icons.photo_album),
              title: new Text('Album'),
            ),
            new ListTile(
              leading: new Icon(Icons.phone),
              title: new Text('Phone'),
            ),
            new ListTile(
              leading: new Icon(Icons.map),
              title: new Text('Map'),
            ),
            new ListTile(
              leading: new Icon(Icons.photo_album),
              title: new Text('Album'),
            ),
            new ListTile(
              leading: new Icon(Icons.phone),
              title: new Text('Phone'),
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

class ListLabel extends StatelessWidget {
  final String title;
  ListLabel(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListTile(
      title: new Text(
        this.title,
        textAlign: TextAlign.left,
        style: new TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
