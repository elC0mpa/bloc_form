import 'package:bloc_form/bloc/login_bloc.dart';
import 'package:bloc_form/bloc/provider.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [loginBackground(context), loginForm(context)],
      ),
    );
  }

  Widget loginForm(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final LoginBloc loginBloc = Provider.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Container(height: 220),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            width: size.width * 0.85,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 3,
                      offset: Offset(0, 5),
                      spreadRadius: 3)
                ]),
            child: Column(
              children: [
                const Text('Login'),
                emailField(loginBloc),
                const SizedBox(height: 15),
                passwordField(loginBloc),
                const SizedBox(height: 15),
                loginButton(loginBloc)
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text('Forgot password?')
        ],
      ),
    );
  }

  Widget loginButton(LoginBloc loginBloc) {
    return StreamBuilder(
        stream: loginBloc.formValidStream,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return ElevatedButton(
            onPressed: snapshot.hasData ? () {} : null,
            style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 10)),
            child: const Text('Login'),
          );
        });
  }

  Widget emailField(LoginBloc loginBloc) {
    return StreamBuilder(
        stream: loginBloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: loginBloc.changeEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  icon: const Icon(Icons.email),
                  hintText: 'example@mail.com',
                  labelText: 'Email',
                  errorText: snapshot.error as String?,
                  counterText: snapshot.data),
            ),
          );
        });
  }

  Widget passwordField(LoginBloc loginBloc) {
    return StreamBuilder(
        stream: loginBloc.passwordStream,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: loginBloc.changePassword,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  icon: const Icon(Icons.email),
                  labelText: 'Password',
                  errorText: snapshot.error as String?,
                  counterText: snapshot.data),
            ),
          );
        });
  }

  Widget loginBackground(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final backgroundColor = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1),
      ])),
    );

    final circle = Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromRGBO(255, 255, 255, 0.1)),
    );

    return Stack(
      children: [
        backgroundColor,
        Positioned(
          child: circle,
          bottom: 80,
          left: -20,
        ),
        Positioned(
          child: circle,
          top: -30,
          left: 20,
        ),
        Positioned(
          child: circle,
          bottom: 30,
          right: 80,
        ),
        Positioned(
          child: circle,
          bottom: -30,
          right: -40,
        ),
        Positioned(
          child: circle,
          top: 0,
          right: 0,
        ),
        Container(
          margin: const EdgeInsets.only(top: 50),
          child: Column(
            children: const [
              Icon(
                Icons.person_pin_circle,
                color: Colors.white,
                size: 100,
              ),
              SizedBox(
                width: double.infinity,
              ),
              Text(
                'El Compa',
                style: TextStyle(color: Colors.white, fontSize: 25),
              )
            ],
          ),
        )
      ],
    );
  }
}
