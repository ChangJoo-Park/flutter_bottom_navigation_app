import 'package:flutter/material.dart';

import '../enums/item-type.dart';

class ListItem {
  final String title;
  final String subtitle;
  final num number;
  final ItemType type;

  const ListItem({this.title, this.subtitle, this.number, this.type});

  get backgroundColor {
    Color backgroundColor;

    switch (type) {
      case ItemType.normal:
        backgroundColor = Colors.amber;
        break;
      case ItemType.canceled:
        backgroundColor = Colors.cyan;
        break;
      case ItemType.waiting:
        backgroundColor = Colors.red;
        break;
      default:
        backgroundColor = Colors.indigo;
    }

    return backgroundColor;
  }
}

const List<ListItem> dummyListItems = const <ListItem>[
  const ListItem(
    title: "Hello",
    subtitle: "World",
    number: 0,
    type: ItemType.normal,
  ),
  const ListItem(
    title: "Hello 1",
    subtitle: "World 1",
    number: 1,
    type: ItemType.canceled,
  ),
  const ListItem(
    title: "Hello 2",
    subtitle: "World 3",
    number: 2,
    type: ItemType.waiting,
  ),
  const ListItem(
    title: "Hello 3",
    subtitle: "World 3",
    number: 3,
    type: ItemType.waiting,
  ),
  const ListItem(
    title: "Hello 4",
    subtitle: "World 4",
    number: 4,
    type: ItemType.normal,
  ),
  const ListItem(
    title: "Hello 5",
    subtitle: "World 5",
    number: 5,
    type: ItemType.normal,
  ),
  const ListItem(
    title: "Hello 6",
    subtitle: "World 6",
    number: 6,
    type: ItemType.canceled,
  ),
];
