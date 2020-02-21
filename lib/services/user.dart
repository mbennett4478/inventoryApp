import 'dart:convert';
import 'dart:io';
import 'package:inventory/models/token.dart';
import 'package:inventory/models/user.dart';
import 'package:inventory/providers/token.dart';
import 'package:inventory/providers/user.dart';
import 'package:inventory/services/api.dart';
import 'package:inventory/services/token.dart';
import 'package:http/http.dart' as http;


class UserService {
  TokenService _tokenService;

  UserService(TokenService tokenService) {
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

  Future<User> getCurrentUser() async {

  }

  // TODO: Add authentication logic
  Future<void> authenticate(String email, String password) async {

  }
}