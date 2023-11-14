import 'package:ecommerce/MyTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  String fieldName;
  String hintText;
  bool isObsecure;
  TextInputType textInputType;
  Widget? suffix;
  String? Function(String?) validator;
  TextEditingController controller = TextEditingController();

  CustomTextFormField(
      {required this.hintText,
      required this.fieldName,
      required this.isObsecure,
        required this.textInputType,
        this.suffix,

      required this.validator,
      required this.controller
    });

  @override
  Widget build(BuildContext context) {
   return Column(
     crossAxisAlignment:CrossAxisAlignment.stretch,children: [
     Padding(
       padding: EdgeInsets.only(top: 20.h),
       child: Text(fieldName,style: MyTheme.mainTheme.textTheme.titleMedium,),
     ),
     Padding(
       padding: EdgeInsets.only(top: 20.h),
       child: TextFormField(


         decoration: InputDecoration(
             hintText: hintText,
             helperStyle: TextStyle(fontWeight: FontWeight.w300,
                 fontSize: 18,
                 color: Color(0xff000000B2)
             ),
             focusedBorder: OutlineInputBorder(
               borderRadius: BorderRadius.circular(15),
               borderSide: BorderSide.none
             ),
             enabledBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(15)
                     ,borderSide: BorderSide.none
             ),
             fillColor: Colors.white,
             filled: true,
           suffixIcon: suffix,

         ),
         style: TextStyle(color: Colors.black87),
         obscureText: isObsecure,
         keyboardType: TextInputType.emailAddress,
         validator: validator,
         controller: controller,
         
         
       ),
     )
   ],);
}}
