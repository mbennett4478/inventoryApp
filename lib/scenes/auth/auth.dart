import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/providers/token.dart';
import 'package:inventory/providers/user.dart';
import 'package:inventory/widgets/commonButton.dart';
import 'package:inventory/widgets/facebook.dart';
import 'package:inventory/widgets/google.dart';
import 'package:inventory/widgets/input.dart';
import 'package:provider/provider.dart';

class Auth extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    print("loading: ${userProvider.loading}, user: ${userProvider.currentUser}");
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
            Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.only(top: 32, left: 32, right: 32),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Input(
                        hintText: 'Email',
                        prefixIcon: Icons.mail,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      Input(
                        hintText: 'Password',
                        prefixIcon: Icons.lock,
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a valid password';
                          }
                          return null;
                        },
                      ),
                      CommonButton(
                        buttonText: 'Login',
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: InkWell(
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onTap: () {
                  print('Make the on tap method do something');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
              child: Text(
                'Or',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 32, right: 32),
              child: Column(
                children: <Widget>[
                  GoogleButton(),
                  FacebookButton(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Don't have an account? "),
                  InkWell(
                    child: Text(
                      "Create One",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () {
                      print("Make the on tap method do something");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}