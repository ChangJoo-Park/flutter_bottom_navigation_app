import 'package:flutter/material.dart';

class StatsPage extends StatefulWidget {
  @override
  _StatsPageState createState() => new _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
        children: <Widget>[
          new SafeArea(
            top: false,
            bottom: false,
            child: new Container(
              padding: const EdgeInsets.all(8.0),
              height: 250.0,
              child: new Card(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new SizedBox(
                      height: 188.0,
                      child: new Container(
                        child: new Text(
                          'Stats Card',
                          style: new TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    new Expanded(
                      child: new Container(
                        child: new Row(
                          children: <Widget>[
                            new RaisedButton(
                              onPressed: () => {},
                              child: new Text('Button 1'),
                              color: Colors.redAccent,
                              textColor: Colors.white,
                            ),
                            new Padding(
                              padding: new EdgeInsets.all(8.0),
                            ),
                            new RaisedButton(
                              onPressed: () => {},
                              child: new Text('Button 2'),
                              color: Colors.redAccent,
                              textColor: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
