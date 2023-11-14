import 'package:dartz/dartz.dart';
import 'package:ecommerce/BaseError.dart';
import 'package:ecommerce/Data/HomeReository/HomeDataSource.dart';
import 'package:ecommerce/Data/HomeReository/HomeRepository.dart';
import 'package:ecommerce/Domain/Entites/CategoriesOrBrandsResponseEntity.dart';
import 'package:flutter/cupertino.dart';

class HomeRepositoryImpl implements HomeRepository{
  HomeDataSource dataSource;
  HomeRepositoryImpl({required this.dataSource});
  @override
  Future<Either<BaseError, CategoriesOrBarndsResponseEntity>> getCategories() {
  return dataSource.getCategories();

  }
  @override
  Future<Either<BaseError, CategoriesOrBarndsResponseEntity>> getBrands() {
    return dataSource.getBrands();
  }
}