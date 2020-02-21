import 'package:inventory/models/token.dart';

class User {
  String email;
  String firstName;
  String lastName;
  TokenPair tokenPair;

  User({
    this.email,
    this.firstName,
    this.lastName,
  });

  User.fromJson(Map<String, dynamic> json) :
    email = json['email'],
    firstName = json['firstName'],
    lastName = json['lastName'];
}