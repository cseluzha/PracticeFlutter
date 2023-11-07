import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String movieDbKey =
      dotenv.env['MOVIEDB_KEY'] ?? 'No hay api key';
  static String movieDbApiUrl =
      dotenv.env['MOVIEDB_API_URL'] ?? 'No hay api url';
}
