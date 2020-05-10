import 'package:emailapp/AppDrawer.dart';
import 'package:emailapp/ContactCounter.dart';
import 'package:emailapp/ContactListBuilder.dart';
import 'package:emailapp/ContactManager.dart';
import 'package:emailapp/ContactSearchDelegate.dart';
import 'package:emailapp/Provider.dart';
import 'package:emailapp/model/Contact.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of(context).fetch(ContactManager);

  manager.inFilter.add('');

    return Scaffold(
        appBar: AppBar(
          title: Text('Contacts'),
          actions: <Widget>[
            ContactCounter(),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: ContactSearchDelegate());
              },
            ),
            Padding(
              padding: EdgeInsets.only(right: 16),
            )
          ],
        ),
        drawer: AppDrawer(),
        body: ContactListBuilder(
          stream: manager.browse$,
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
