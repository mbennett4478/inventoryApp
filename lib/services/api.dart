import 'package:inventory/models/token.dart';
import 'package:inventory/providers/token.dart';

class ApiService<T> {
  String _baseUrl = 'http://localhost:4000/api/v1';
  TokenProvider _tokenProvider;

  ApiService(this._tokenProvider);

  TokenProvider get tokenProvider => _tokenProvider;

  Future<T> get(String url) async {

  }

  Future<T> post(String url) async {

  }
}