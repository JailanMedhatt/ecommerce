
import 'package:ecommerce/Data/AuthRepositiry/AuthRepositoryContract.dart';

import 'package:ecommerce/register/RegisterState.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewModel extends Cubit<RegisterStates> {


  RegisterViewModel({required this.repositoryContract}) : super(InitialRegisterState());
  AuthRepositoryContract repositoryContract;
  TextEditingController nameController = TextEditingController(text: "Jailan");
  TextEditingController emailController = TextEditingController(text: "jailan@yahoo.com");
  TextEditingController phoneController = TextEditingController(text: "01024064673");
  TextEditingController passController = TextEditingController(text: "123456");
  TextEditingController rePassController = TextEditingController(text: "123456");
  final formKey= GlobalKey<FormState>();
  void register() async{
    if(formKey.currentState?.validate()==true) {
      emit(loadingRegisterState());
      var response = await repositoryContract.getRegisterResponse(
          nameController.text, passController.text,
          phoneController.text, emailController.text, rePassController.text);
      if (response?.error != null) {
        emit(FailedRegisterState(
            errorMessage: response?.error?.msg ?? "Wrong phone Number"));
      }
      else if (response?.message == "success") {
        emit(SuccessRegisterState(response: response!));
      }
      else if (response?.statusMsg == "fail") {
        emit(FailedRegisterState(
            errorMessage: response?.message ?? "Email already exist"));
      }
    }
  }
  String? emailValidator(String? text){
    if(text==null|| text.trim().isEmpty){
      return "Email required";
    }
    bool isValid= RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text);
    if(!isValid){
      return "Wrong Email Format";
    }
    return null;
  }
  String? nameValidator(String? text){
    if(text==null|| text.trim().isEmpty){
      return "Name required";
    }
  }
  String? phoneValidator(String? text){
    if(text==null|| text.trim().isEmpty){
      return "phone Number required";
    }
  }
  String? passValidator(String? text){
    if(text==null|| text.trim().isEmpty){
      return "Password required";
    }
    else if(text.length<5){
      return "Weak password";
    }
    return null;
  }
  String? conPassValidator(String? text){
    if(text==null|| text.trim().isEmpty){
      return "Confirmation Password required";
    }
    else if(text!=passController.text){
      return "Password doesn't match";
    }
  }
}
