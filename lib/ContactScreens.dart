import 'package:emailapp/AppDrawer.dart';
import 'package:emailapp/ContactManager.dart';
import 'package:emailapp/model/Contact.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  ContactManager manager = ContactManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        actions: <Widget>[
          Chip(
            label: StreamBuilder<int>(
                stream: manager.contactCounter,
                builder: (context, snapshot) {
                  return Text(
                    (snapshot.data ?? 0).toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),
            backgroundColor: Colors.red,
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: StreamBuilder<List<Contact>>(
          stream: manager.contactListView,
          builder:
              (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                List<Contact> contacts = snapshot.data;
                return ListView.separated(
                    itemCount: contacts?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      Contact _contact = contacts[index];

                      return ListTile(
                        title: Text(_contact.name),
                        subtitle: Text(_contact.email),
                        leading: CircleAvatar(),
                      );
                    },
                    separatorBuilder: (context, index) => Divider());
            }
          }),
    );
  }
}
