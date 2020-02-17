import 'package:flutter/cupertino.dart';
import 'package:inventory/models/user.dart';

class UserProvider extends ChangeNotifier {
  final User _currentUser = User();

  User fetchCurrentUser() {
    return _currentUser;
  }
}