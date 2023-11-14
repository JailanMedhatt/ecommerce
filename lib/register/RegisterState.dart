import 'package:ecommerce/Data/Register/Response.dart';

abstract class RegisterStates{}
class loadingRegisterState extends RegisterStates{}
class FailedRegisterState extends RegisterStates{
  String errorMessage;
  FailedRegisterState({required this.errorMessage});
}
class SuccessRegisterState extends RegisterStates{
  Response response;
  SuccessRegisterState({required this.response});
}
class InitialRegisterState extends RegisterStates{}