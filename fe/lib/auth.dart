import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveAuthToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('auth_token', token);
}

Future<String?> getAuthToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('auth_token');
}

Future<void> removeAuthToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('auth_token'); // we will use it in log out
}