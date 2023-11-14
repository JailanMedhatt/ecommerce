import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce/BaseError.dart';
import 'package:ecommerce/Data/CategoriesOrBrandsResponse.dart';
import 'package:ecommerce/Data/HomeReository/HomeDataSource.dart';
import 'package:ecommerce/Domain/Entites/CategoriesOrBrandsResponseEntity.dart';
import 'package:http/http.dart' as http;
class HomeCategoriesDataSourceImpl implements HomeDataSource{
  @override
  Future<Either<BaseError, CategoriesOrBarndsResponseEntity>> getCategories() async {
    try{
      //ecommerce.routemisr.com/api/v1/categorie
      Uri url = Uri.https("ecommerce.routemisr.com","/api/v1/categories");
      var res = await http.get(url);
      var json= jsonDecode(res.body);
      var catRes= CategoriesOrBrandResponse.fromJson(json);
      if(catRes.message!=null){
        return Left(BaseError(errorMessage: catRes.message!));
      }
      print("done");
      return Right(catRes);

    }
        catch(e){
          print(e.toString());
          return Left(BaseError(errorMessage: e.toString()));
        }
  }
  @override
  Future<Either<BaseError, CategoriesOrBarndsResponseEntity>> getBrands() async {
    try {
      //ecommerce.routemisr.com/api/v1/categorie
      Uri url = Uri.https("ecommerce.routemisr.com", "/api/v1/brands");
      var res = await http.get(url);
      var json = jsonDecode(res.body);
      var catRes = CategoriesOrBrandResponse.fromJson(json);
      if (catRes.message != null) {
        return Left(BaseError(errorMessage: catRes.message!));
      }
      print("done");
      return Right(catRes);
    }
    catch (e) {
      print(e.toString());
      return Left(BaseError(errorMessage: e.toString()));
    }
  }}