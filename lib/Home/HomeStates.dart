import 'package:ecommerce/Domain/Entites/CategoriesOrBrandsResponseEntity.dart';

abstract class HomeStates{}
class IntialHomeState extends HomeStates{}
class ChangingTabState extends HomeStates{}
class LoadingCategoriesState extends HomeStates{}
class SuccessCategoriesState extends HomeStates{
  List<DataEntity>? categories;
  SuccessCategoriesState({required this.categories});
}
class FailedCategoriesState extends HomeStates{
  String? errorMessage;
  FailedCategoriesState({required this.errorMessage});
}
class LoadingBrandState extends HomeStates{}
class SuccessBrandState extends HomeStates{
  List<DataEntity>? categories;
  SuccessBrandState({required this.categories});
}
class FailedBrandState extends HomeStates{
  String? errorMessage;
  FailedBrandState({required this.errorMessage});
}
