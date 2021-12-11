import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:learning/ui/helpers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/ui/state/root/root_bloc.dart';
import 'package:learning/ui/pages/login/bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              showSuccessScaffold(context, "Bienvenido");

              context.read<RootBloc>().add(
                    RootCheckAuth(),
                  );
            }

            if (state is LoginFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.errorMessage,
                    style: const TextStyle(color: Colors.black),
                  ),
                  backgroundColor: Colors.yellowAccent,
                ),
              );
            }
          },
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: FormLogin(),
          ),
        ),
      ),
    );
  }
}

class FormLogin extends StatefulWidget {
  const FormLogin({
    Key? key,
  }) : super(key: key);

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: usernameController,
            decoration: const InputDecoration(labelText: 'Username'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Debe introducir un nombre de usuario';
              }

              if (value.length < 4) {
                return 'Debe tener al menos 4 caracteres';
              }

              return null;
            },
          ),
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'La contraseña no debe ir vacia';
              }

              if (value.length < 4) {
                return 'Debe tener al menos 4 caracteres';
              }

              return null;
            },
            obscureText: true,
          ),
          BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
            var loading = false;

            if (state is LoginLoading) {
              loading = state.loading;
            }

            return ElevatedButton(
                onPressed: loading
                    ? null
                    : () {
                        _loginAttempt(context);
                      },
                child: const Text('Iniciar Sesion'));
          }),
          BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
            var loading = false;

            if (state is LoginLoading) {
              loading = true;
            }

            if (loading) return const CircularProgressIndicator();

            return const SizedBox.shrink();
          }),
        ],
      ),
    );
  }

  _loginAttempt(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<LoginBloc>().add(
            LoginAttemptEvent(usernameController.text, passwordController.text),
          );
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
