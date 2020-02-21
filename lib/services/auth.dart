import 'dart:convert';
import 'dart:io';

import 'package:inventory/models/token.dart';
import 'package:inventory/services/token.dart';
import 'package:http/http.dart' as http;

class AuthService {
  TokenService _tokenService;

  AuthService(TokenService tokenService) {
    _tokenService = tokenService;
  }

  Future<bool> tokenPairValid() async {
    var tokenPair = await _tokenService.getTokenPair();
    if (tokenPair == null) {
      return false;
    }

    var res = await http.get('/verify', headers: {HttpHeaders.authorizationHeader: tokenPair.accessToken});
    if (res.statusCode == 200) {
      return true;
    }

    res = await http.get('/verify', headers: {HttpHeaders.authorizationHeader: tokenPair.refreshToken});
    if (res.statusCode != 200) {
      await _tokenService.setTokenPair(null);
      return false;
    }

    var newTokenPair = await refreshAccessToken(tokenPair.refreshToken);
    if (newTokenPair == null) {
      return false;
    }
    await _tokenService.setTokenPair(newTokenPair);
    return true;
  }

  Future<TokenPair> refreshAccessToken(String refreshToken) async {
    var res = await http.get('/get', headers: {HttpHeaders.authorizationHeader: refreshToken});
    if (res.statusCode != 200) {
      return null;
    }
    var newTokenPair = TokenPair.fromJson(jsonDecode(res.body));

    return newTokenPair;
  }

  // TODO: Add authentication logic
  Future<void> authenticate(String email, String password) async {

  }
}