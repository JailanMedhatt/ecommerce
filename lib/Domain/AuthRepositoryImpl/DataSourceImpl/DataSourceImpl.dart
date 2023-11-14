import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce/BaseError.dart';
import 'package:ecommerce/Data/AuthRepositiry/DataSource/DataSource.dart';
import 'package:ecommerce/Data/Register/Request.dart';
import 'package:ecommerce/Data/Register/Response.dart';
import 'package:ecommerce/Data/login/LoginResponse.dart';
import 'package:ecommerce/Data/login/loginResquest.dart';
import 'package:ecommerce/Domain/Entites/ResponseEntity.dart';
import 'package:http/http.dart' as http;
class RemoteDataSourceImpl implements RemoteDataSource{
  @override
  Future<Response?> getRegisterResponse(String name, String password, String phoneNumber, String email, String rePass) async {
    //https://ecommerce.routemisr.com/api/v1/auth/signup
    try{
      Uri url= Uri.https("ecommerce.routemisr.com","/api/v1/auth/signup");
      var request= Request(name: name,email: email,password: password,phone: phoneNumber,rePassword: rePass);
      var response= await http.post(url,body: request.toJson());
      var json =jsonDecode(response.body);
      print("done");
      return Response.fromJson(json);
    }
    catch(e){
      print(e.toString());
    }

  }
  @override
  Future<Either<BaseError, ResponseEntity>> login(String email, String pass)async {
    try{
      Uri url=Uri.https("ecommerce.routemisr.com","/api/v1/auth/signin");
      var request=LoginResquest(email: email,password: pass);
      var responseString=await http.post(url,body:request.toJson());
      var json= jsonDecode(responseString.body);
      var response= LoginResponse.fromJson(json);
      if(response.statusMsg!=null){
        return Left(BaseError(errorMessage: response.message));
      }

 else{
   return Right(response.toResponseEntity());
      }

    }
        catch(e){
       return Left(BaseError(errorMessage: e.toString()));
        }
  }
}
RemoteDataSource injectDataSource(){
  return RemoteDataSourceImpl();
}