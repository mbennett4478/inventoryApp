import 'package:flutter/cupertino.dart';

class CommonForm extends StatelessWidget {
  CommonForm({
//    this.formKey,
    Key key,
    this.children = const <Widget>[],
  }) : super(key: key);

//  final GlobalKey<FormState> formKey;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: this.key,
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