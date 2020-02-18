import 'dart:convert';

import 'package:inventory/models/token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tokens {
  Future<TokenPair> getTokenPair() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var stringTokenPair = prefs.get('tokenpair');
    var tokenPair = stringTokenPair != null ? TokenPair.fromJson(jsonDecode(stringTokenPair)) : null;
    return tokenPair;
  }

  Future<void> setTokenPair(TokenPair tokenPair) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('tokenpair', jsonEncode(tokenPair.toJson()));
  }
}