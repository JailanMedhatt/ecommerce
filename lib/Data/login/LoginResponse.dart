import 'package:ecommerce/Data/Register/Response.dart';
import 'package:ecommerce/Domain/Entites/ResponseEntity.dart';

/// message : "success"
/// user : {"name":"Jailan","email":"jailan@yahoo.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1M2Q3ZTc2NjBhNzMzNzRhYTg3NTk3NyIsIm5hbWUiOiJKYWlsYW4iLCJyb2xlIjoidXNlciIsImlhdCI6MTY5ODcxMzM2OCwiZXhwIjoxNzA2NDg5MzY4fQ.c_sCzOlcCc9z6p-XPLXHv_8-40TjFmMXBK68ApNwx5I"

class LoginResponse {
  LoginResponse({
      this.message, 
      this.user, 
      this.token,this.statusMsg});

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    statusMsg=json['statusMsg'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  User? user;
  String? token;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
  ResponseEntity toResponseEntity(){
    return ResponseEntity(user: user?.toUserEntity() ,token: token);
  }

}

/// name : "Jailan"
/// email : "jailan@yahoo.com"
/// role : "user"

