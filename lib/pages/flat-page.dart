import "package:flutter/material.dart";

class FlatPage extends StatelessWidget {
  final String title;

  FlatPage(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(body: new Center(child: new Text(title)));
  }
}
