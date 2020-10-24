import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveLocalData(String key, String data) async {
  final prefs = await SharedPreferences.getInstance();
  print(key);
  print(data);
  prefs.setString(key, data);
}

Future<String> getLocalData(String key) async {
  final prefs = await SharedPreferences.getInstance();
  String data = prefs.getString(key) ?? "null";
  print(key + ":" + data);
  return (data);
}
