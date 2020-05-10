import 'dart:convert';

import 'package:emailapp/model/Contact.dart';
import 'package:http/http.dart' as http;

class ContactService {
  static String _url = 'https://jsonplaceholder.typicode.com/users';
  static Future<List<Contact>> browse({query}) async {
    http.Response response = await http.get(_url);
    String content = response.body;

    List collection = json.decode(content);

    Iterable<Contact> _contacts =
        collection.map((json) => Contact.fromJson(json)).toList();

    if (query != null && query.isNotEmpty) {
      _contacts = _contacts
          .where((contact) => contact.name.toLowerCase().contains(query.toLowerCase()));
    }

    return _contacts.toList();
  }
}
