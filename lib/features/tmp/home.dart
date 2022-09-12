import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurants/app.dart';
import 'package:restaurants/router.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Future _getProfile() async {
    log('Home: _getProfile', name: 'Home::_getProfile');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FutureBuilder(
          future: _getProfile(),
          builder: (context, snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Home Page'),
                Text('Profile: ${snapshot.data}'),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(ScreenPaths.login);
                  },
                  child: Text('login'),
                )
              ],
            );
          }),
    ));
  }
}
