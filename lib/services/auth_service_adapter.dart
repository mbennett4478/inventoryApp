import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:inventory/models/user.dart';
import 'package:inventory/services/auth_service.dart';

import 'bsmple_auth_service.dart';

enum AuthServiceType {
  bsmple
}

class AuthServiceAdapter implements AuthService {
  AuthServiceAdapter({@required AuthServiceType initialAuthServiceType})
      : authServiceTypeNotifier = ValueNotifier<AuthServiceType>(initialAuthServiceType) {
    _setup();
  }

  final BsmpleAuthService _bsmpleAuthService = BsmpleAuthService();

  final ValueNotifier<AuthServiceType> authServiceTypeNotifier;
  AuthServiceType get authServiceType => authServiceTypeNotifier.value;
  AuthService get authService => authServiceType == AuthServiceType.bsmple
      ? _bsmpleAuthService : _bsmpleAuthService;

  StreamSubscription<User> _bsmpleAuthSubscription;

  void _setup() {
    _bsmpleAuthSubscription = _bsmpleAuthService.onAuthStateChanged.listen((User user) {
      if (authServiceType == AuthServiceType.bsmple) {
        _onAuthStateChangedController.add(user);
      }
    }, onError: (dynamic error) {
      if (authServiceType == AuthServiceType.bsmple) {
        _onAuthStateChangedController.addError(error);
      }
    });
  }

  @override
  void dispose() {
    _onAuthStateChangedController?.close();
    _bsmpleAuthService.dispose();
    authServiceTypeNotifier.dispose();
  }

  final StreamController<User> _onAuthStateChangedController = StreamController<User>.broadcast();

  @override
  Stream<User> get onAuthStateChanged => _onAuthStateChangedController.stream;

  @override
  Future<User> currentUser() => authService.currentUser();

  @override
  Future<User> createUserWithEmailAndPassword(String email, String password) =>
      authService.createUserWithEmailAndPassword(email, password);

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) =>
      authService.signInWithEmailAndPassword(email, password);

  @override
  Future<void> sendPasswordResetEmail(String email) =>
      authService.sendPasswordResetEmail(email);

  @override
  Future<User> signInWithEmailAndLink({String email, String link}) =>
      authService.signInWithEmailAndLink(email: email, link: link);

  @override
  Future<bool> isSignInWithEmailLink(String link) =>
      authService.isSignInWithEmailLink(link);

  @override
  Future<void> sendSignInWithEmailLink({
    @required String email,
    @required String url,
    @required bool handleCodeInApp,
    @required String iOSBundleID,
    @required String androidPackageName,
    @required bool androidInstallIfNotAvailable,
    @required String androidMinimumVersion,
  }) => authService.sendSignInWithEmailLink(
      email: null,
      url: null,
      handleCodeInApp: null,
      iOSBundleID: null,
      androidPackageName: null,
      androidInstallIfNotAvailable: null,
      androidMinimumVersion: null
  );

  @override
  Future<User> signInWithFacebook() => authService.signInWithFacebook();

  @override
  Future<User> signInWithGoogle() => authService.signInWithGoogle();

  @override
  Future<void> signOut() => authService.signOut();
}