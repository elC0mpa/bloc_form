import 'dart:async';
import 'package:bloc_form/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get emailStream =>
      _emailController.stream.transform(emailValidation);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(passwordValidation);
  Stream<bool> get formValidStream =>
      Rx.combineLatest2(emailStream, passwordStream, ((a, b) => true));

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
