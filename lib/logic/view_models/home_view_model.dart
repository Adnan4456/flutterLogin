import 'dart:async';


import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel {
  final _usernameController = StreamController<String>();

  Stream<String> get usernameStream => _usernameController.stream;

  HomeViewModel() {
    _loadUsername();
  }

  void _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    _usernameController.sink.add(username ?? '');
  }

  void dispose() {
    _usernameController.close();
  }
}