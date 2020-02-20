import 'package:inventory/models/token.dart';

class ApiService<T> {
  String _baseUrl = 'http://localhost:4000/api/v1';
  TokenPair _tokenPair;

  ApiService(TokenPair tokenPair) {
    _tokenPair = tokenPair;
  }

  Future<T> get(String url) async {

  }

  Future<T> post(String url) async {

  }
}