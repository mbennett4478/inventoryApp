import 'dart:convert';
import 'dart:io';

import 'package:inventory/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:inventory/services/tokens.dart';

class UserService {
  String _baseUrl = 'http://localhost:4000/api/v1/';

  Tokens _tokens = Tokens();

  Future<User> fetchCurrentUser() async {
    var tokenPair = await _tokens.getTokenPair();
    if (tokenPair == null) {
      return null;
    }
    var response = await http.get(_baseUrl + 'me', headers: {
      HttpHeaders.authorizationHeader: tokenPair.accessToken,
    });

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body)['data']);
    } else if (response.statusCode == 401) {
      _tokens.
    }
  }
}