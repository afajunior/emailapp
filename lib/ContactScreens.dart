import 'package:emailapp/AppDrawer.dart';
import 'package:emailapp/ContactListBuilder.dart';
import 'package:emailapp/ContactManager.dart';
import 'package:emailapp/ContactSearchDelegate.dart';
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
            StreamBuilder<int>(
                stream: manager.contactCounter,
                builder: (context, snapshot) {
                  return Chip(
                    label: Text(
                      (snapshot.data ?? 0).toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: Colors.red,
                  );
                }),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context, delegate: ContactSearchDelegate(manager));
              },
            ),
            Padding(
              padding: EdgeInsets.only(right: 16),
            )
          ],
        ),
        drawer: AppDrawer(),
        body: ContactListBuilder(
          stream: manager.contactListView,
          builder: (context, contacts) {
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
          },
        ));
  }
}
