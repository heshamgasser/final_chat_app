class UserModel {
  String id;
  String firstName;
  String lastName;
  String emailAddress;

  UserModel(
      {this.id = '',
      required this.firstName,
      required this.lastName,
      required this.emailAddress});

  UserModel.fromFireStore(Map<String, dynamic> json)
      : this(
            id: json['id'],
            firstName: json['firstName'],
            lastName: json['lastName'],
            emailAddress: json['emailAddress']);

  Map<String, dynamic> addToFireStore() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'emailAddress': emailAddress
    };
  }
}
