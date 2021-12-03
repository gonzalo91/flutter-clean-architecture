import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/ui/pages/login/bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if(state is LoginLoading){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Login Ok"),
                backgroundColor: Colors.green,
              )
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
                    labelText: 'Username',
                  ),
                  obscureText: true,
                ),
                BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                  var loading = false;

                  if (state is LoginInitial) {
                    loading = state.loading;
                  }

                  if (state is LoginLoading) {
                    loading = state.loading;
                  }

                  return ElevatedButton(
                      onPressed: loading
                          ? null
                          : () {
                              print('click1');

                              loginBloc.add(
                                  LoginButtonEvent('username', 'password'));
                            },
                      child: const Text('Iniciar Sesion'));
                }),
                BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                  var counter = '0';
                  if (state is LoginInitial) {
                    counter = state.counter.toString();
                  }

                  if (state is LoginLoading) {
                    counter = state.tries.toString();
                  }

                  return Text(counter);
                }),
                BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                  var loading = false;
                  if (state is LoginInitial) {
                    loading = state.loading;
                  }

                  if (state is LoginLoading) {
                    loading = state.loading;
                  }

                  if (loading) return const Text('Cargando');

                  return const SizedBox.shrink();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
