import 'dart:async';
import 'dart:convert';

import 'package:inventory/models/bsmple_sign_in.dart';
import 'package:inventory/models/user.dart';
import 'package:inventory/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BsmpleAuthService implements AuthService {

  BsmpleAuthService() {
    Future.delayed(Duration(seconds: 2)).then((_) async {
      _add(null).then((_) => null);
    });
  }

  User _userFromBsmpleSignIn(BsmpleSignIn bsmpleSignIn) {
    if (bsmpleSignIn == null) {
      return null;
    }

    return User(
      id: bsmpleSignIn.bsmpleUser.id,
      firstName: bsmpleSignIn.bsmpleUser.firstName,
      lastName: bsmpleSignIn.bsmpleUser.lastName,
      accessToken: bsmpleSignIn.accessToken,
      refreshToken: bsmpleSignIn.refreshToken,
    );
  }

  User _currentUser;

  final StreamController<User> _onAuthStateChangedController = StreamController<User>();

  @override
  Stream<User> get onAuthStateChanged => _onAuthStateChangedController.stream;

  Future<void> _add(User user) async {
    _currentUser = user;
    await setUserInStorage(_currentUser);
    _onAuthStateChangedController.add(_currentUser);
  }

  Future<void> setUserInStorage(User user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('user', user != null ? jsonEncode(user.toJson()) : null);
  }

  Future<User> getUserFromStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var stringUser = prefs.get('user');
    var user = stringUser != null ? User.fromJson(jsonDecode(stringUser)) : null;
    return user;
  }


  @override
  Future<User> createUserWithEmailAndPassword(String email, String password) {
    // TODO: implement createUserWithEmailAndPassword
    return null;
  }

  @override
  Future<User> currentUser() async {
    if (_currentUser == null) {
      var user = await getUserFromStorage();
      _add(user);
    }

    return _currentUser;
  }

  @override
  void dispose() {
    _onAuthStateChangedController.close();
  }

  @override
  Future<bool> isSignInWithEmailLink(String link) {
    // TODO: implement isSignInWithEmailLink
    return null;
  }

  @override
  Future<void> sendPasswordResetEmail(String email) {
    // TODO: implement sendPasswordResetEmail
    return null;
  }

  @override
  Future<void> sendSignInWithEmailLink({String email, String url, bool handleCodeInApp, String iOSBundleID, String androidPackageName, bool androidInstallIfNotAvailable, String androidMinimumVersion}) {
    // TODO: implement sendSignInWithEmailLink
    return null;
  }

  @override
  Future<User> signInWithEmailAndLink({String email, String link}) {
    // TODO: implement signInWithEmailAndLink
    return null;
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) {
    // TODO: implement signInWithEmailAndPassword
    return null;
  }

  @override
  Future<User> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    return null;
  }

  @override
  Future<User> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    return null;
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    _add(null);
  }
}