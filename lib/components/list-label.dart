import "package:flutter/material.dart";

class ListLabel extends StatelessWidget {
  final String title;
  ListLabel(this.title);

  @override
  Widget build(BuildContext context) {
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
