import 'package:flutter/material.dart';

import '../logic/view_models/home_view_model.dart';

class HomePage extends StatelessWidget {
  final _homeViewModel = HomeViewModel();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: StreamBuilder<String>(
          stream: _homeViewModel.usernameStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text('Welcome, ${snapshot.data}!');
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}