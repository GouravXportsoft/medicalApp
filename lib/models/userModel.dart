class UserModel {
  int? id;
  String? userName;
  String? password;
  String? email;
  String? phone;
  String? DOB;
  String? profilepic;

  UserModel({
    this.id,
    this.userName,
    this.password,
    this.email,
    this.phone,
    this.DOB,
    this.profilepic,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json['id'] as int?,
        userName: json['userName'],
        password: json['password'],
        email: json['email'],
        phone: json['mobileNumber'],
        DOB: json['yearOfBirth'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'userName': userName,
        'password': password,
        'email': email,
        'mobileNumber': phone,
        'yearOfBirth': DOB,
      };
}
