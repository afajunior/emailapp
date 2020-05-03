import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

part 'Message.g.dart';

@JsonSerializable()
class Message {
  final String subject;
  final String body;

  Message(this.subject, this.body);

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  static Future<List<Message>> brownse({status = 'important'}) async {
    String url = status == 'important'
        ? 'http://www.mocky.io/v2/5eaf05563300000e009f42dd'
        : 'http://www.mocky.io/v2/5eacd5523300008524dfe6ac';
    http.Response response = await http.get(url);

    await Future.delayed(Duration(seconds: 1));

    String content = response.body;
    List collection = json.decode(content);
    List<Message> _messages =
        collection.map((json) => Message.fromJson(json)).toList();

    return _messages;
  }
}
