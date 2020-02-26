import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/models/user.dart';
import 'package:inventory/scenes/auth/auth.dart';
import 'package:inventory/scenes/main/main.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({Key key, @required this.userSnapshot}) : super(key: key);
  final AsyncSnapshot<User> userSnapshot;

  @override
  Widget build(BuildContext context) {
    if (userSnapshot.connectionState == ConnectionState.active) {
      return userSnapshot.hasData ? Main() : Auth();
    }

    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}