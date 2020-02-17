import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FacebookButton extends StatelessWidget {
  FacebookButton({
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
            color: Color(0xFF4267B2),
            elevation: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Image.asset(
                    'images/facebook-logo.png',
                    height: 18,
                    width: 18,
                  ),
                ),
                Text(
                  'Continue with Facebook',
                  style: TextStyle(
                    color: Colors.white,
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
//    );
  }
}