import 'package:ecommerce/Domain/UseCases/CategoriesUseCase.dart';
import 'package:ecommerce/Home/CustomBottomNavigationBar.dart';
import 'package:ecommerce/Home/HomeStates.dart';
import 'package:ecommerce/Home/HomeViewModel.dart';
import 'package:ecommerce/MyTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "home";

HomeViewModel viewModel =HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeViewModel,HomeStates>(
        bloc:viewModel,builder: (context,state){

      return   SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(canvasColor: MyTheme.primaryBlue),
              child: CustomBottomNavigationBar(
                selectedIndex: viewModel.selectedIndex,
                onTap: (index){
                  viewModel.changeSelectedIndex(index);
                },
              )),
          body: viewModel.tabs[viewModel.selectedIndex],
        ),
      );
    }, listener:(context, state){});

  }
}
