import 'package:ecommerce/Data/Register/Error.dart';
import 'package:ecommerce/Domain/Entites/UserEntity.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmuttii000058@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1M2Q1ZGQxNjBhNzMzNzRhYTg2YzJlOCIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjk4NTIwNTMwLCJleHAiOjE3MDYyOTY1MzB9.S68KsWh6QiPjFIlXfrnjlL234Izt_TnEESbsRYEXlfo"

class Response {
  Response({
      this.message, 
      this.user, 
      this.token,this.statusMsg,
  this.error});

  Response.fromJson(dynamic json) {
    message = json['message'];
    error= json['errors']!=null? Errors.fromJson(json['errors']):null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg=json['statusMsg'];
  }
  String? message;
  User? user;
  String? token;
  String? statusMsg;
  Errors? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

}

/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmuttii000058@gmail.com"
/// role : "user"

class User {
  User({
      this.name, 
      this.email, 
      this.role,});

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
  String? name;
  String? email;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;}
    UserEntity toUserEntity(){
    return UserEntity(name: name,email: email, role: role);
  }

}