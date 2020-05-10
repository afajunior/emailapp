import 'package:emailapp/Observer.dart';
import 'package:emailapp/model/Contact.dart';
import 'package:flutter/material.dart';

class ContactListBuilder extends StatelessWidget {
  final Function builder;
  final Stream stream;

  const ContactListBuilder({this.builder, this.stream});

  @override
  Widget build(BuildContext context) {
    return Observer<List<Contact>>(
      stream: stream,
      onSuccess: (context, data) => builder(context, data),
      onWaiting: (context) => LinearProgressIndicator(),
    );
  }
}
