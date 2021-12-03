import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:learning/injection_container.dart' as ic;
import 'package:learning/ui/pages/login/bloc/login_bloc.dart';
import 'package:learning/ui/pages/login/login_page.dart';
import 'package:learning/ui/state/network_info/network_info_bloc.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ic.init();  
  await dotenv.load(fileName: ".env");
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (_) => LoginBloc()),
        BlocProvider<NetworkInfoBloc>(create: (_) => NetworkInfoBloc()..add(CheckNetworkInfoEvent())),        
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(        
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

