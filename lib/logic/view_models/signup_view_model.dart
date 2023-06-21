import 'package:shared_preferences/shared_preferences.dart';

class SignUpViewModel {
  Future<void> signUp(
      String username,
      String password, {
        required Function() onSuccess,
        required Function(String) onError,
      }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUsername = prefs.getString('username');

    if (storedUsername != null) {
      onError('Username already exists.');
    } else {
      await prefs.setString('username', username);
      await prefs.setString('password', password);
      onSuccess();
    }
  }
}