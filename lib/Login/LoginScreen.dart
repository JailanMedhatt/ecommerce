import 'package:ecommerce/CustomTextFormField.dart';
import 'package:ecommerce/DialogUtills.dart';
import 'package:ecommerce/Domain/UseCases/LoginUseCase.dart';
import 'package:ecommerce/Home/HomeScreen.dart';
import 'package:ecommerce/Login/LoginStates.dart';
import 'package:ecommerce/Login/LoginViewModel.dart';
import 'package:ecommerce/MyTheme.dart';
import 'package:ecommerce/register/Register.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObsecure = true;
  LoginViewModel viewModel=LoginViewModel(useCase: injectLoginUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel,LoginStates>(bloc: viewModel,
        listener:(context, state){
         if(state is LoadingLoginState){
           DialogUtills.showLoading(context);
         }
         else if(state is FailedLoginState){
           DialogUtills.hideLoading(context);
           DialogUtills.showMessage(state.errorMessage??"", context,actionName: "ok");
         }
         else if(state is SuccessLoginState){
           DialogUtills.hideLoading(context);
           DialogUtills.showMessage(state.responseEntity?.token??"", context,actionName: "ok",action: (){Navigator.pushReplacementNamed(context,HomeScreen.routeName);});
         }
        }
    ,child:  Scaffold(
      backgroundColor: MyTheme.primaryBlue,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 91.h, left: 91.w, bottom: 87.h, right: 92.w),
              child: Image.asset("assets/images/route_logo.png"),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Welcome back to route",
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Text(
                    "please Login with your email",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: MyTheme.white),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.h),
                    child: Form(
                      key: viewModel.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomTextFormField(
                              hintText: "Enter Your Email",
                              fieldName: "Email",
                              isObsecure: false,
                              textInputType: TextInputType.emailAddress,
                              controller: viewModel.emailController,
                              validator: viewModel.emailValidator,
                            ),
                            CustomTextFormField(
                              hintText: "Enter Your Password",
                              fieldName: "Password",
                              controller: viewModel.passController,
                              validator: viewModel.passValidator,
                              isObsecure: isObsecure,
                              textInputType: TextInputType.number,
                              suffix: IconButton(
                                  onPressed: () {
                                    isObsecure == true
                                        ? isObsecure = false
                                        : isObsecure = true;
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    isObsecure == true
                                        ? Icons.visibility
                                        : Icons.visibility_off_sharp,
                                    color: MyTheme.primaryBlue,
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 7.h),
                              child: Text(
                                "Forget Password",
                                style: MyTheme.mainTheme.textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w400),
                                textAlign: TextAlign.end,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 50.h),
                              child: ElevatedButton(
                                onPressed: () {
                                  viewModel.login();
                                },
                                child: Text("Login",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,
                                    color: MyTheme.primaryBlue)),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),

                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 23.h,
                                        horizontal: 161.w)
                                ),

                              ),

                            ),
                            TextButton(onPressed:(){
                              Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
                            }, child: Text("Dont have an account? Create Account",style: MyTheme.mainTheme.textTheme.titleMedium,))
                          ],
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),);

  }
}
