import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel {
  Future<void> login(
      String username,
      String password, {
        required Function() onSuccess,
        required Function(String) onError,
      }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUsername = prefs.getString('username');
    String? storedPassword = prefs.getString('password');

    if (storedUsername == username && storedPassword == password) {
      onSuccess();
    } else {
      onError('Invalid username or password.');
    }
  }
}