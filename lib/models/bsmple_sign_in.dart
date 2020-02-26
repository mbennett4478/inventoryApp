import 'package:inventory/models/bsmple_user.dart';

class BsmpleSignIn {
  String accessToken;
  String refreshToken;
  BsmpleUser bsmpleUser;

  BsmpleSignIn({
    this.accessToken,
    this.refreshToken,
    this.bsmpleUser,
  });
}