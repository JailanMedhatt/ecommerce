
import 'package:ecommerce/BaseError.dart';
import 'package:ecommerce/Data/Register/Response.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/Domain/Entites/ResponseEntity.dart';

abstract class AuthRepositoryContract{
  Future <Response?> getRegisterResponse(String name, String password, String phoneNumber, String email,String rePass);
  Future<Either<BaseError,ResponseEntity>> login(String email, String pass);
}

