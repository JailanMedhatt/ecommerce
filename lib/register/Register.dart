import 'package:ecommerce/CustomTextFormField.dart';
import 'package:ecommerce/Domain/AuthRepositoryImpl/AuthRepositoryImpl.dart';
import 'package:ecommerce/DialogUtills.dart';
import 'package:ecommerce/Login/LoginScreen.dart';
import 'package:ecommerce/MyTheme.dart';

import 'package:ecommerce/register/RegisterState.dart';
import 'package:ecommerce/register/RegisterViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "register";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isObsecure = true;
  RegisterViewModel viewModell=RegisterViewModel(repositoryContract: injectRepoistory());
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel,RegisterStates>(
      bloc: viewModell,
        listener:(context,state){
     if(state is SuccessRegisterState){
       DialogUtills.hideLoading(context);
       DialogUtills.showMessage( state.response.user?.name??"", context,actionName: "ok");
     }
     else if(state is loadingRegisterState){
       DialogUtills.showLoading(context);
     }
     else if(state is FailedRegisterState){
       DialogUtills.hideLoading(context);
       DialogUtills.showMessage( state.errorMessage, context,actionName: "ok");
     }

        }
    ,child: Scaffold(
      backgroundColor: MyTheme.primaryBlue,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 91.h, left: 91.w, bottom: 10.h, right: 92.w),
              child: Image.asset("assets/images/route_logo.png"),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Padding(
                    padding: EdgeInsets.only(top: 30.h),
                    child: Form(
                      key: viewModell.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomTextFormField(
                              hintText: "Enter Your Full Name",
                              fieldName: "Full Name",
                              isObsecure: false,
                              textInputType: TextInputType.text,
                              controller: viewModell.nameController,
                              validator: viewModell.nameValidator,
                            ),CustomTextFormField(
                              hintText: "Enter Your Phone Number",
                              fieldName: "Phone Number",
                              isObsecure: false,
                              textInputType: TextInputType.phone,
                              controller: viewModell.phoneController,
                              validator: viewModell.phoneValidator,

                            ),
                            CustomTextFormField(
                              hintText: "Enter Your Email",
                              fieldName: "Email",
                              isObsecure: false,
                              textInputType: TextInputType.emailAddress,
                              controller: viewModell.emailController,
                              validator: viewModell.emailValidator,
                            ),

                            CustomTextFormField(
                              hintText: "Enter Your Password",
                              fieldName: "Password",
                              isObsecure: isObsecure,
                              textInputType: TextInputType.number,
                              controller: viewModell.passController,
                              validator: viewModell.passValidator,
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
                            CustomTextFormField(
                              hintText: "Re-Enter Your Password",
                              fieldName: "Confirm Password",
                              controller: viewModell.rePassController,
                              isObsecure: isObsecure,
                              textInputType: TextInputType.number,
                              validator: viewModell.conPassValidator,
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
                              padding: EdgeInsets.only(top: 40.h),
                              child: ElevatedButton(
                                onPressed: () {
                                  viewModell.register();
                                },
                                child: Text("Register",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,
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
                            Padding(
                              padding:EdgeInsets.only(bottom:40.h),
                              child: TextButton(onPressed:(){
                                Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                              }, child: Text("Already have an account?",style: MyTheme.mainTheme.textTheme.titleMedium,)),
                            )
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
