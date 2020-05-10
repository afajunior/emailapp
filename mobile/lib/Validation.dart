import 'dart:async';

mixin Validation {
  static bool isEmail(String email) => email.contains('@');

  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isEmail(value)) {
      sink.add(value);
    } else {
      sink.addError("Out message error");
    }
  });

  final validateSubject =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.isEmpty) {
      sink.addError("`SUBJECT` cannot be empty");
    } else if (value.length < 4) {
      sink.addError("`SUBJECT` must be longer than 4 characters");
    } else {
      sink.add(value);
    }
  });
}
