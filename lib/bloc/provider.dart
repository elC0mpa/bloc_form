import 'package:bloc_form/bloc/login_bloc.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget {
  Provider({Key? key, required Widget child}) : super(key: key, child: child);

  final LoginBloc loginBloc = LoginBloc();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider)
        .loginBloc;
  }
}
