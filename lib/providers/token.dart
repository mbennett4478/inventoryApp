import 'package:flutter/cupertino.dart';
import 'package:inventory/models/token.dart';
import 'package:inventory/services/token.dart';

class TokenProvider with ChangeNotifier {
  bool _loading;
  TokenPair _tokenPair = TokenPair();

  TokenProvider(TokenService tokenService) {
    _loading = true;
    notifyListeners();
    tokenService.getTokenPair().then((res) {
      _loading = false;
      set(res);
    });
  }

  TokenPair get tokenPair => _tokenPair;

  void set(TokenPair tokenPair) {
    _tokenPair = tokenPair;
    notifyListeners();
  }
}