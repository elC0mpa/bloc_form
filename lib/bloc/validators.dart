import 'dart:async';

class Validators {
  final passwordValidation = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length < 8) {
      sink.addError('Password must have at least 8 characters');
    } else {
      sink.add(password);
    }
  });

  final emailValidation =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (emailValid) {
      sink.add(email);
    } else {
      sink.addError('Not valid email');
    }
  });
}
