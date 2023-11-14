import 'package:ecommerce/CustomAdSlider.dart';
import 'package:ecommerce/Domain/Entites/CategoriesOrBrandsResponseEntity.dart';
import 'package:ecommerce/Domain/UseCases/BrandsUseCase.dart';
import 'package:ecommerce/Domain/UseCases/CategoriesUseCase.dart';
import 'package:ecommerce/Home/HomeStates.dart';
import 'package:ecommerce/HomeTabViewModel.dart';
import 'package:ecommerce/MyTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class homeTap extends StatelessWidget {
  HomeViewTapModel viewModel=HomeViewTapModel(categoriesUseCase: injectCategoryUseCase(), brandsUseCase: injectBrandsUseCase());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<HomeViewTapModel, HomeStates>(
        bloc: viewModel..GetCategories()..GetBrands(),
        builder:(context, state){
          if(state is LoadingCategoriesState|| state is LoadingBrandState){
            return Padding(
              padding:  EdgeInsets.symmetric(vertical:300.h),
              child: Center(child: CircularProgressIndicator(color: MyTheme.primaryBlue,),),
            );
          }
          else if(state is FailedCategoriesState){
            return Column(
              children: [Text(state.errorMessage??"")],
            );
          }
          else if(state is SuccessCategoriesState||state is SuccessBrandState){

          return Container(
            margin: EdgeInsets.all(10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/route_home_logo.png",
                    ),
                  ],
                ),
                CustomAdSlider(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(color: MyTheme.primaryBlue, fontSize: 18),
                    ),
                    Text(
                      "View all",
                      style: TextStyle(color: MyTheme.primaryBlue, fontSize: 12),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: 15.h
                  ),
                  height: 250.h,
                  child: Expanded(
                    child: GridView.builder(itemCount: viewModel.categories?.length??0,
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 0,
                            crossAxisSpacing:0
                        ),
                        itemBuilder:(context,index)=>Expanded(
                          child: Column(
                            children: [
                              Expanded(flex:8,child: CircleAvatar(radius: 40.r, backgroundImage: NetworkImage(viewModel.categories?[index]?.image??""))),
                              Expanded( flex: 2,
                                child: Text(viewModel.categories?[index].name??"",
                                    style: TextStyle(color: MyTheme.primaryBlue, fontSize: 15, fontWeight: FontWeight.w400)),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),Text("Brands",style: TextStyle(color: MyTheme.primaryBlue, fontSize: 18)),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: 15.h
                  ),
                  height: 250.h,
                  child: Expanded(
                    child: GridView.builder(itemCount: viewModel.brands?.length??0,
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 0,
                            crossAxisSpacing:0
                        ),
                        itemBuilder:(context,index)=>Expanded(
                          child: Column(
                            children: [
                              Expanded(flex:8,child: CircleAvatar(radius: 40.r, backgroundImage: NetworkImage(viewModel.brands?[index]?.image??""))),
                              Expanded( flex: 2,
                                child: Text(viewModel.brands?[index].name??"",
                                    style: TextStyle(color: MyTheme.primaryBlue, fontSize: 15, fontWeight: FontWeight.w400)),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),

              ],
            ),
          );}
          
       return Text("???");
      } ),
    );}
    
    //   child: Container(
    //     margin: EdgeInsets.all(10.h),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.stretch,
    //       children: [
    //         Row(
    //           children: [
    //             Image.asset(
    //               "assets/images/route_home_logo.png",
    //             ),
    //           ],
    //         ),
    //         CustomAdSlider(),
    //
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Text(
    //               "Categories",
    //               style: TextStyle(color: MyTheme.primaryBlue, fontSize: 18),
    //             ),
    //             Text(
    //               "View all",
    //               style: TextStyle(color: MyTheme.primaryBlue, fontSize: 12),
    //             ),
    //           ],
    //         ),
    //         Container(
    //           margin: EdgeInsets.symmetric(
    //             vertical: 15.h
    //           ),
    //           height: 230.h,
    //           child: Expanded(
    //             child: GridView.builder(itemCount: 20,
    //                 scrollDirection: Axis.horizontal,
    //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //                     crossAxisCount: 2,
    //                   mainAxisSpacing: 16,
    //                   crossAxisSpacing:16
    //                 ),
    //                 itemBuilder:(context,index)=>Column(
    //                   children: [
    //                     CircleAvatar(radius: 40.r, backgroundImage: NetworkImage("")),
    //                     Text("Women",
    //                         style: TextStyle(color: MyTheme.primaryBlue, fontSize: 15, fontWeight: FontWeight.w400)),
    //                   ],
    //                 )),
    //           ),
    //         ),
    //
    //       ],
    //     ),
    //   ),
    // );
  }

