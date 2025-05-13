class UserModel{
  int? id;
  String? username;
  String? email;
  String? password;
  UserModel({ this.id, this.username,this.email,this.password });
  factory UserModel.fromJson(Map<String,dynamic>json){
    return UserModel(
      id: json["id"],
      username: json["username"],
      email:  json["email"],
      password:  json["password"]
    );
  }
  factory UserModel.initial(){
    return UserModel(id:-1,username: "Dummy User",email: "dummyuser@email.com",password: "********");
  }
  UserModel copyWith({required int id, required String username,required String email,required String password,}){
    return UserModel(
      id: id,
      email: email,
      password: password,
      username: username,
    );
  }
}

