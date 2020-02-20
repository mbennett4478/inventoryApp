import 'package:inventory/services/api.dart';

class AuthService {
  ApiService _apiService;

  AuthService(ApiService apiService) {
    _apiService = apiService;
  }
}