import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/ui/helpers.dart';
import 'package:learning/ui/pages/home/bloc/home_bloc.dart';
import 'package:learning/ui/state/root/root_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeLoadingEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: BlocListener<RootBloc, RootState>(
          listener: (context, state) {
            if (state is RootLocalAuthenticated) {
              showWarningScaffold(context,
                  "No fue posible verificar. Verifique su conexion a internet");
            }

            if (state is RootAuthenticated) {
              showSuccessScaffold(context, "Verificacion exitosa");
            }
          },
          child: Container(
              child: Center(
            child: Column(
              children: [
                Text('Home Page'),
                BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                  if (state is HomeUserState) {
                    return Text('Bienvenido: ' + state.user.name);
                  }

                  return const SizedBox.shrink();
                }),
                BlocBuilder<RootBloc, RootState>(builder: (context, state) {
                  if (state is RootLocalAuthenticated) {
                    return Column(
                      children: [
                        Text('No fue posible verificar auth en servidor'),
                        ElevatedButton(
                            onPressed: () {
                              context.read<RootBloc>().add(
                                    RootCheckAuth(),
                                  );
                            },
                            child: Text('Verificar Auth')),
                      ],
                    );
                  }

                  return Text('Verificacion exitosa');
                }),
                ElevatedButton(
                  onPressed: () {
                    context.read<RootBloc>().add(
                          RootLogOutEvent(),
                        );
                  },
                  child: Text('Cerrar Sesion'),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
