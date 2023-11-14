import 'package:ecommerce/Domain/Entites/ResponseEntity.dart';

abstract class LoginStates{}
class IntialLoginState extends LoginStates{}
class LoadingLoginState extends LoginStates{}
class SuccessLoginState extends LoginStates{
  ResponseEntity? responseEntity;
  SuccessLoginState({required this.responseEntity});
}
class FailedLoginState extends LoginStates{
  String? errorMessage;
  FailedLoginState({required this.errorMessage});
}