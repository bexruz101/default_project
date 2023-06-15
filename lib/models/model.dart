import 'package:default_project/ui/profile/profile_screen.dart';

class ProfileModel{
  String name;
  String email;
  String dataOfBirth;
  String phoneNumber;
  String password;

  ProfileModel({required this.name,required this.dataOfBirth,required this.email, this.password = '',required this.phoneNumber});

   ProfileModel.fromJson(Map<String,dynamic>json): name = json['name'], dataOfBirth= json['dataOfBirth'], email= json['email'], password=json['password'], phoneNumber= json['phoneNumber'];


  Map<String,dynamic> toJson()=>{
    'name':name,
    'email':email,
    'dataOfBirth':dataOfBirth,
    'phoneNumber':phoneNumber,
    'password':password,
  };
}