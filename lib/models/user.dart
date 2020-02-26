
class User {
  int id;
  String email;
  String firstName;
  String lastName;
  String accessToken;
  String refreshToken;

  User({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.accessToken,
    this.refreshToken,
  });

  User.fromJson(Map<String, dynamic> json) :
    email = json['email'],
    firstName = json['firstName'],
    lastName = json['lastName'],
    accessToken = json['accessToken'],
    refreshToken = json['refreshToken'];


  Map<String, dynamic> toJson() => {
    'email': email,
    'firstName': firstName,
    'lastName': lastName,
    'accessToken': accessToken,
    'refreshToken': refreshToken,
  };
}