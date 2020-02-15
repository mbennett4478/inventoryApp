import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  CommonButton({
    this.buttonText = '',
  });

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ButtonTheme(
        minWidth: double.infinity,
        child: RaisedButton(
          color: Color.fromRGBO(67, 64, 81, 1.0),
          elevation: 10,
          onPressed: () {},
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}