import 'package:dartz/dartz.dart';
import 'package:ecommerce/Data/AuthRepositiry/DataSource/DataSource.dart';
import 'package:ecommerce/Data/AuthRepositiry/AuthRepositoryContract.dart';
import 'package:ecommerce/Data/Register/Response.dart';
import 'package:ecommerce/Domain/AuthRepositoryImpl/DataSourceImpl/DataSourceImpl.dart';

import '../../BaseError.dart';
import '../Entites/ResponseEntity.dart';


class AuthRepositoryImpl implements AuthRepositoryContract{
  RemoteDataSource dataSource;
  AuthRepositoryImpl({required this.dataSource});
  @override
  Future<Response?> getRegisterResponse(String name, String password, String phoneNumber, String email, String rePass) {
    return dataSource.getRegisterResponse(name, password, phoneNumber, email, rePass);
  }
  @override
  Future<Either<BaseError, ResponseEntity>> login(String email, String pass) {
    return dataSource.login(email, pass);
  }
}
AuthRepositoryContract injectRepoistory(){
  return AuthRepositoryImpl(dataSource: injectDataSource());
}