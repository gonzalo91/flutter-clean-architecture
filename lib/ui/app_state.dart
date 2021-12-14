import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/ui/pages/home/home_page.dart';
import 'package:learning/ui/state/root/root_bloc.dart';
import 'package:learning/ui/pages/login/login_page.dart';
import 'package:learning/ui/state/network_info/network_info_bloc.dart';
import 'package:learning/ui/pages/splash_screen/splash_screen_page.dart';

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RootBloc>(
            create: (_) => RootBloc()..add(RootInitializeApp())),
        BlocProvider<NetworkInfoBloc>(
          create: (_) => NetworkInfoBloc()..add(CheckNetworkInfoEvent()),
        ),
      ],
      child: BlocBuilder<RootBloc, RootState>(builder: (context, state) {
        if (state is RootInitial) {
          return const SplashScreenPage();
        }

        if (state is RootUnauthenticated || state is RootLogOut) {
          return const LoginPage();
        }

        if (state is RootAuthenticated || state is RootLocalAuthenticated) {
          return const HomePage();
        }

        return const SplashScreenPage();
      }),
    );
  }
}
