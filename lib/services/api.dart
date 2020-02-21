import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:inventory/models/token.dart';
import 'package:inventory/providers/token.dart';
import 'package:inventory/services/token.dart';
import 'package:http/http.dart' as http;

class ApiService<T> {
  String _baseUrl = 'http://localhost:4000/api/v1';
  TokenService _tokenService;

  ApiService(TokenService tokenService) {
    _tokenService = tokenService;
  }

  Future<TokenPair> getTokens() async {
    return _tokenService.getTokenPair();
  }

  Future<TokenPair> isValidTokenPair(TokenPair tokenPair) async {
    var response = await http.get('/verify', headers: {HttpHeaders.authorizationHeader: tokenPair.accessToken});
    if (response.statusCode == 200) {
      return tokenPair;
    }
    response = await http.get('/verify', headers: {HttpHeaders.authorizationHeader: tokenPair.refreshToken});
    if (response.statusCode != 200) {
      await _tokenService.setTokenPair(null);
      return null;
    }

    var accessToken = await refreshAccessToken(tokenPair.refreshToken);
    tokenPair.accessToken = accessToken;
    await _tokenService.setTokenPair(tokenPair);
    return tokenPair;
  }

  Future<http.Response> get(String url) async {

  }

  Future<http.Response> post(String url) async {

  }

  Future<http.Response> authenticatedGet(String url) async {

  }

  Future<http.Response> authenticatedPost(String url, Map<String, dynamic> json) async {
    TokenPair tokenPair = await _tokenService.getTokenPair();
    return await http.post(url, {HttpHeaders.authorizationHeader: tokenPair.accessToken});
  }
}