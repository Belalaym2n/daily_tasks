import 'package:daily_tasks5/models/task_mode.dart';

class UserModel{
  String? name;
  String? age;
  String email;
  String?id;

  UserModel({required this.name,required this.age,
    required this.email,required this.id});
  UserModel.fromJson(Map<String,dynamic>json):this(

     email: json["email"],
     age: json["age"],
     name: json["name"],
     id: json["id"],
  );

  Map<String,dynamic> toJson(){
    return {
      "email":email,
      "age":age,
      "name":name,
      "id":id,
    };


  }
}