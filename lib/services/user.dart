import 'dart:convert';
import 'package:inventory/models/user.dart';
import 'package:inventory/services/api.dart';

class UserService {
  ApiService _apiService;

  UserService(ApiService apiService) {
    _apiService = apiService;
  }

  Future<User> fetchCurrentUser() async {
    var response = await _apiService.get('/me');
    return User.fromJson(jsonDecode(response.body)['data']);
  }
}