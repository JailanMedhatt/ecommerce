
import 'package:ecommerce/Domain/Entites/CategoriesOrBrandsResponseEntity.dart';
import 'package:ecommerce/Domain/UseCases/CategoriesUseCase.dart';
import 'package:ecommerce/Home/HomeStates.dart';
import 'package:ecommerce/tabs/Favourite.dart';
import 'package:ecommerce/tabs/ProfileTap.dart';
import 'package:ecommerce/tabs/ShoppingTap.dart';
import 'package:ecommerce/tabs/homeTap.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewModel extends Cubit<HomeStates>{
  int selectedIndex = 0;



  List<Widget> tabs = [homeTap(), ShoppingTap(), FavouriteTap(), ProfileTap()];
  HomeViewModel():super(IntialHomeState());
  changeSelectedIndex(int index){
    // emit(IntialHomeState());
    selectedIndex=index;
    emit(ChangingTabState());
  }


}
