import 'address_model.dart';
import 'name_model.dart';

class UserModel {
  AddressModel address;
  int id;
  String email;
  String username;
  String password;
  NameModel name;
  String phone;
  int v;

  UserModel({required this.id,
    required this.phone,
    required this.name,
    required this.password,
    required this.email,
    required this.address,
    required this.username,
    required this.v});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        phone: json['phone'],
        name: json['name'],
        password: json['password'],
        email: json['email'],
        address: json['address'],
        username: json['username'],
        v: json['__v']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "phone": phone,
      "name": name,
      "password": password,
      "email": email,
      "address": address,
      "username": username,
      "v": v
    };
  }
}