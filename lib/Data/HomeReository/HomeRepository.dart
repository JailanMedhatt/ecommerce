import 'package:dartz/dartz.dart';
import 'package:ecommerce/BaseError.dart';
import 'package:ecommerce/Domain/Entites/CategoriesOrBrandsResponseEntity.dart';

abstract class HomeRepository{
  Future<Either<BaseError,CategoriesOrBarndsResponseEntity>> getCategories();
  Future<Either<BaseError,CategoriesOrBarndsResponseEntity>> getBrands();
}