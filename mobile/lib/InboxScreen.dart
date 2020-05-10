import 'package:emailapp/AppDrawer.dart';
import 'package:emailapp/ComposeButton.dart';
import 'package:emailapp/MessageList.dart';
import 'package:flutter/material.dart';

class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
          child: Scaffold(
        appBar: AppBar(
          title: Text('Inbox'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.refresh), onPressed: () {})
          ],
          bottom: TabBar(tabs: <Widget>[
            Tab(text: "Important"),
            Tab(text: "Other"),
          ]),
        ),
        drawer: AppDrawer(),
        body: TabBarView(
          children: <Widget>[
            //TODO: Passar para o construtor a lista de mensagens, e não uma string.
            MessageList(status: 'important'),
            MessageList(status: 'other')
          ],
        ),
        floatingActionButton: ComposeButton([]),
      ),
      length: 2,
    );
  }
}
