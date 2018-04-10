import "dart:async";

import "package:flutter/material.dart";

import "../models/list-item.dart";

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
        child: new ItemList(dummyListItems),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List<ListItem> _listItem;

  ItemList(this._listItem);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemBuilder: _buildItems,
      itemCount: _listItem.length,
    );
  }

  Widget _buildItems(context, index) {
    return new ListItemWidget(_listItem[index]);
  }
}

class ListItemWidget extends StatelessWidget {
  final ListItem item;

  const ListItemWidget(this.item);

  Widget _buildTiles(BuildContext context, ListItem item) {
    return new ListTile(
      title: new Text(item.title),
      subtitle: new Text(item.subtitle),
      leading: new CircleAvatar(
        child: new Text(item.number.toString()),
        backgroundColor: item.backgroundColor,
        foregroundColor: Colors.white,
      ),
      onTap: () => print('hello'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(context, item);
  }
}
