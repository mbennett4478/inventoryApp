class User {
  String email;
  String firstName;
  String lastName;

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