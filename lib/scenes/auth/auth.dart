import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/widgets/commonButton.dart';
import 'package:inventory/widgets/input.dart';
import 'package:inventory/widgets/commonForm.dart';

class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/logo.png',
              color: Colors.white,
              width: 100,
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Text(
                'App Name',
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            CommonForm(
              children: <Widget>[
                Input(
                  hintText: 'Email',
                  prefixIcon: Icons.mail,
                ),
                Input(
                  hintText: 'Password',
                  prefixIcon: Icons.lock,
                  obscureText: true,
                ),
                CommonButton(
                  buttonText: 'Login',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}