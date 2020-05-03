import 'package:emailapp/AppDrawer.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text('Contacts'),
      ),
    );
  }
}
