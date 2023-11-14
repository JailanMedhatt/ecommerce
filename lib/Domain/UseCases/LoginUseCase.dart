import 'package:dartz/dartz.dart';
import 'package:ecommerce/Data/AuthRepositiry/AuthRepositoryContract.dart';
import 'package:ecommerce/Domain/AuthRepositoryImpl/AuthRepositoryImpl.dart';
import '../../BaseError.dart';
import '../Entites/ResponseEntity.dart';

class LoginUseCase{
  AuthRepositoryContract repositoryContract;
  LoginUseCase({required this.repositoryContract});
  Future<Either<BaseError, ResponseEntity>> invoke(String email, String pass) {
    return repositoryContract.login(email, pass);
  }
}
LoginUseCase injectLoginUseCase(){
  return LoginUseCase(repositoryContract: injectRepoistory());
}