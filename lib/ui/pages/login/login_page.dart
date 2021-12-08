import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/ui/helpers.dart';
import 'package:learning/ui/pages/login/bloc/login_bloc.dart';
import 'package:learning/ui/state/root/root_bloc.dart';

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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Username'),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
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
                                context.read<LoginBloc>().add(
                                      LoginAttemptEvent('username', 'password'),
                                    );
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
            ),
          ),
        ),
      ),
    );
  }
}
