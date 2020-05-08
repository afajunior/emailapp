import 'dart:async';

import 'package:emailapp/model/Contact.dart';
import 'package:emailapp/service/ContactService.dart';
import 'package:rxdart/subjects.dart';

class ContactManager {
  final BehaviorSubject<int> _contactCounter = BehaviorSubject<int>();
  Stream<int> get count$ => _contactCounter.stream;
  
  Stream<List<Contact>> browse$({query}) =>
      Stream.fromFuture(ContactService.browse(query: query));

  ContactManager() {
    browse$().listen((list) => _contactCounter.add(list.length));
  }
}
