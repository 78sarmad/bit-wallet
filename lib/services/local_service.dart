import 'package:shared_preferences/shared_preferences.dart';

class LocalService {
  Future<String> getName() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString("name");
    return (name);
  }

  Future<String> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString("email");
    return (email);
  }

  Future<void> setDetails(String name, String email) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("name", name);
    prefs.setString("email", email);
  }
}
