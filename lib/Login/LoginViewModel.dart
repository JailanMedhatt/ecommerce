import 'package:dartz/dartz.dart';
import 'package:ecommerce/Domain/UseCases/LoginUseCase.dart';
import 'package:ecommerce/Login/LoginStates.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


class LoginViewModel extends Cubit<LoginStates>{
  LoginUseCase useCase;
  TextEditingController emailController = TextEditingController(text: "jailan@yahoo.com");
  TextEditingController passController = TextEditingController(text: "123456");
  final formKey= GlobalKey<FormState>();

  LoginViewModel({required this.useCase}):super(IntialLoginState());
   void login() async{
     if(formKey.currentState?.validate()==true){
    emit(LoadingLoginState());
    var either= await useCase.invoke(emailController.text, passController.text);
   return either.fold((l) {
     emit(FailedLoginState(errorMessage: l.errorMessage));
   }, (r){
     emit(SuccessLoginState(responseEntity: r));

   });
  }}

  String? emailValidator(String? text){
    if(text==null|| text.trim().isEmpty){
      return "Email required";
    }
    return null;
  }
  String? passValidator(String? text){
    if(text==null|| text.trim().isEmpty){
      return "Password required";
    }
    return null;
  }

}