import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

class Config {
  static late String apiUrl;

  static Future<void> load() async {
    String configString = await rootBundle.loadString('config/config.json');
    Map<String, dynamic> config = json.decode(configString);
    apiUrl = config['apiUrl'];
  }
}