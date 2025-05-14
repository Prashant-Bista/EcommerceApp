class UserModel {
  int? id;
  String? username;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? phone;
  String? city;
  String? street;
  int? number;
  String? zipcode;

  UserModel({
    this.id,
    this.username,
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.phone,
    this.city,
    this.number,
    this.street,
    this.zipcode,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      username: json["username"],
      email: json["email"],
      password: json["password"],
      firstName: json["name"]["firstname"],
      lastName: json["name"]["lastname"],
      phone: json["phone"],
      city: json["address"]["city"],
      street: json["address"]["street"],
      number: json["address"]["number"],
      zipcode: json["address"]["zipcode"],
    );
  }
  factory UserModel.initial() {
    return UserModel(
      id: -1,
      username: "DummyD",
      email: "dummyuser@email.com",
      password: "********",
      firstName:"Dummy",
      lastName: "User",
      phone: "1-007-786-2213",
      city: "Dhanbad",
      street: "Baker Street",
      zipcode: "12345-6789",
        number: 1234

    );
  }
  UserModel copyWith({
    required int id,
    required String username,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
    required String city,
    required String street,
    required int number,
    required String zipcode,
  }) {
    return UserModel(
      id: id,
      email: email,
      password: password,
      username: username,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      city:city,
      street: street,
      number: number,
      zipcode: zipcode
    );
  }
}

class UserListModel {
  List<UserModel>? userList;

  UserListModel({this.userList});
  factory UserListModel.initial() {
    return UserListModel(userList: [UserModel.initial()]);
  }
  UserListModel copyWith({required List<UserModel>? listOfUsers}) {
    return UserListModel(userList: listOfUsers);
  }
}
