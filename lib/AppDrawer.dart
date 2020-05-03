import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountEmail: Text('myemail@email.com'),
          accountName: Text('Anselmo Júnior'),
          currentAccountPicture: CircleAvatar(child: Text("AJ")),
          otherAccountsPictures: <Widget>[
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(title: Text('Adding new account'));
                    });
              },
              child: CircleAvatar(
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
        ),
        ListTile(
            leading: Icon(FontAwesomeIcons.inbox),
            title: Text('Inbox'),
            trailing: Chip(
              label: Text(
                '11',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.blue[100],
            )),
        ListTile(leading: Icon(FontAwesomeIcons.edit), title: Text('Draft')),
        ListTile(
            leading: Icon(FontAwesomeIcons.archive), title: Text('Archive')),
        ListTile(
            leading: Icon(FontAwesomeIcons.paperPlane), title: Text('Sent')),
        ListTile(leading: Icon(FontAwesomeIcons.trash), title: Text('Trash')),
        Divider(),
        Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: ListTile(
                leading: Icon(FontAwesomeIcons.cog), title: Text('Settings')),
          ),
        ),
      ],
    ));
  }
}
