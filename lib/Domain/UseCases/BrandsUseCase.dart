import 'package:dartz/dartz.dart';
import 'package:ecommerce/BaseError.dart';
import 'package:ecommerce/Data/HomeReository/HomeDataSource.dart';
import 'package:ecommerce/Data/HomeReository/HomeRepository.dart';
import 'package:ecommerce/Domain/Entites/CategoriesOrBrandsResponseEntity.dart';
import 'package:ecommerce/Domain/HomeRepositoryImpl/HomeDataSource.dart';
import 'package:ecommerce/Domain/HomeRepositoryImpl/HomeRepositoryImpl.dart';
import 'package:ecommerce/Domain/UseCases/CategoriesUseCase.dart';

class BrandsUseCase{
  HomeRepository repository;
  BrandsUseCase({required this.repository});
  Future<Either<BaseError,CategoriesOrBarndsResponseEntity>> invoke(){
    return repository.getBrands();
  }
}
BrandsUseCase injectBrandsUseCase(){
  return BrandsUseCase(repository: injectHomeRepository());
}
