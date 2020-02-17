import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  GoogleButton({
    this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: ButtonTheme(
        minWidth: double.infinity,
        child: RaisedButton(
          elevation: 10,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Image.asset(
                  'images/google-logo.png',
                  height: 18,
                  width: 18,
                ),
              ),
              Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
          onPressed: () {
            print('Google button pressed');
          },
        ),
      ),
    );
  }
}