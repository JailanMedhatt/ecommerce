import 'package:ecommerce/Domain/Entites/UserEntity.dart';

class ResponseEntity{
  UserEntity? user;
  String? token;
  ResponseEntity({this.user,this.token});

}