import 'dart:convert';

import 'package:emailapp/model/Contact.dart';
import 'package:http/http.dart' as http;

class ContactService {
  static String _url = 'http://my-server-here:3000/contacts';
  static Future<List<Contact>> browse({query}) async {
    http.Response response = await http.get('$_url?q=$query');
    String content = response.body;

    List collection = json.decode(content);

    Iterable<Contact> _contacts = collection.map((_) => Contact.fromJson(_));

    return _contacts.toList();
  }
}
