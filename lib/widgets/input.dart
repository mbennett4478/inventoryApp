import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  Input({
    this.hintText = '',
    this.prefixIcon,
    this.onChange,
    this.obscureText = false,
  });

  final bool obscureText;
  final String hintText;
  final IconData prefixIcon;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5, right: 15),
          child: prefixIcon != null ? Icon(
            prefixIcon,
            color: Colors.white,
          ) : null,
        ),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        hintText: this.hintText,
        hintStyle: TextStyle(color: Colors.white),
      ),
      onChanged: onChange != null ? onChange : (value) {},
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a valid value';
        }
        return null;
      },
    );
  }
}
