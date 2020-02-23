import 'package:flutter/cupertino.dart';
import 'package:inventory/models/user.dart';
import 'package:inventory/providers/token.dart';
import 'package:inventory/services/user.dart';

class UserProvider extends ChangeNotifier {
  User _currentUser;
  bool _loading;
  UserService _userService;

  UserProvider(UserService userService) {
    _userService = _userService;
  }

  User get currentUser => _currentUser;
  bool get loading => _loading;

  Future<void> checkForCurrentUser() async {

  }

  Future<void> fetchCurrentUser() async {
    _loading = true;
    notifyListeners();

    var user = await _userService.getCurrentUser();
    _currentUser = user;
    _loading = false;
    notifyListeners();
  }
}