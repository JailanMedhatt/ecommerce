import 'package:dartz/dartz.dart';
import 'package:ecommerce/BaseError.dart';
import 'package:ecommerce/Data/HomeReository/HomeDataSource.dart';
import 'package:ecommerce/Data/HomeReository/HomeRepository.dart';
import 'package:ecommerce/Domain/Entites/CategoriesOrBrandsResponseEntity.dart';
import 'package:ecommerce/Domain/HomeRepositoryImpl/HomeDataSource.dart';
import 'package:ecommerce/Domain/HomeRepositoryImpl/HomeRepositoryImpl.dart';

class CategoriesUseCase{
  HomeRepository repository;
  CategoriesUseCase({required this.repository});
  Future<Either<BaseError,CategoriesOrBarndsResponseEntity>> invoke(){
    return repository.getCategories();
  }
}
CategoriesUseCase injectCategoryUseCase(){
  return CategoriesUseCase(repository: injectHomeRepository());
}
HomeRepository injectHomeRepository(){
  return HomeRepositoryImpl(dataSource: injectCatDataSource());
}
HomeDataSource injectCatDataSource(){
  return HomeCategoriesDataSourceImpl();
}