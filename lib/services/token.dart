import 'dart:convert';
import 'package:inventory/models/token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenService {
  TokenPair _tokenPair;

  Future<TokenPair> getTokenPair() async {
    if (_tokenPair != null) {
      return _tokenPair;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var stringTokenPair = prefs.get('tokenpair');
    var tokenPair = stringTokenPair != null ? TokenPair.fromJson(jsonDecode(stringTokenPair)) : null;
    return tokenPair;
  }

  Future<void> setTokenPair(TokenPair tokenPair) async {
    _tokenPair = tokenPair;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('tokenpair', jsonEncode(tokenPair.toJson()));
  }
}