class BsmpleUser {
  int id;
  String email;
  String firstName;
  String lastName;

  BsmpleUser({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
  });

  BsmpleUser.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        email = json['email'],
        firstName = json['first_name'],
        lastName = json['last_name'];

}