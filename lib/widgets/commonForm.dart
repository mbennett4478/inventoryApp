import 'package:flutter/cupertino.dart';

class CommonForm extends StatelessWidget {
  final List<Widget> children;

  CommonForm({
    this.children = const <Widget>[],
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: children,
          ),
        ),
      ),
    );
  }
}