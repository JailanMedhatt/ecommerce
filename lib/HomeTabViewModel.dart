import 'package:ecommerce/Domain/Entites/CategoriesOrBrandsResponseEntity.dart';
import 'package:ecommerce/Domain/UseCases/BrandsUseCase.dart';
import 'package:ecommerce/Domain/UseCases/CategoriesUseCase.dart';
import 'package:ecommerce/Home/HomeStates.dart';


import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewTapModel extends Cubit<HomeStates>{

  CategoriesUseCase categoriesUseCase;
  BrandsUseCase brandsUseCase;
  List<DataEntity>? brands=[];
  List<DataEntity>? categories=[];

  HomeViewTapModel({required this.categoriesUseCase, required this.brandsUseCase}):super(IntialHomeState());

  GetCategories() async{
    emit(LoadingCategoriesState());
    var either = await categoriesUseCase.invoke();
    return either.fold((l) {
      emit(FailedCategoriesState(errorMessage: l.errorMessage));
    }, (r)  {
      categories=r.data;
      emit(SuccessCategoriesState(categories: r.data));
    });

  }
  GetBrands() async{
    emit(LoadingBrandState());
    var either = await brandsUseCase.invoke();
    return either.fold((l) {
      emit(FailedBrandState(errorMessage: l.errorMessage));
    }, (r)  {
      brands=r.data;
      emit(SuccessBrandState(categories: r.data));

    });

  }


}
