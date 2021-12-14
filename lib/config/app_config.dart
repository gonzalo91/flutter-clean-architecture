import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig{

  final String name = dotenv.get('APP_NAME', fallback: 'Flutter App');
  final String version = dotenv.get('APP_VERSION', fallback: 'v1.0.0');
  final String apiUrl = dotenv.get('APP_API_URL', fallback: 'http://192.180.10.10');

}