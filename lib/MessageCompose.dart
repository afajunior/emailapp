import 'package:emailapp/Message.dart';
import 'package:flutter/material.dart';

class MessageCompose extends StatefulWidget {
  @override
  _MessageComposeState createState() => _MessageComposeState();
}

class _MessageComposeState extends State<MessageCompose> {
  String to = "";
  String subject = "";
  String body = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Compose New Message'),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            ListTile(
              title: TextField(
                onChanged: (value) {
                  to = value;
                },
                decoration: InputDecoration(
                    labelText: 'TO',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            ListTile(
                title: TextField(
              onChanged: (value) {
                subject = value;
              },
              decoration: InputDecoration(
                  labelText: 'SUBJECT',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold)),
            )),
            ListTile(
                title: TextField(
              onChanged: (value) {
                body = value;
              },
              decoration: InputDecoration(
                  labelText: 'BODY',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold)),
              maxLines: 9,
            )),
            ListTile(
              title: RaisedButton(
                child: Text('SEND'),
                onPressed: () {
                  Message message = Message(subject, body);
                  Navigator.pop(context, message);
                },
              ),
            )
          ],
        )));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}
