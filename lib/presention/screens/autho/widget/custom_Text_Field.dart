
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_project_session_11/core/utils/app_styel.dart';
import 'package:to_do_project_session_11/core/utils/colors_manager.dart';
typedef Validator=String ? Function(String?) ;
class CustomTextField extends StatelessWidget {
   CustomTextField({super.key,required this.hintText ,
     required this.controller,
     required this.validator ,
     this.isScure=false,
     required this.keyboaredType
   });
   String hintText;
   TextEditingController controller;
  Validator validator;
  bool isScure=true;
  TextInputType keyboaredType;


  @override
  Widget build(BuildContext context) {

    return TextFormField(
      validator: validator,
controller: controller,
        obscureText: isScure,
        decoration:InputDecoration(
            hintText: hintText,
            helperStyle: AppLightStyles.hint,
            fillColor: ColorsManager.white,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r)
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),


            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r)
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(color: Colors.red,width: 2)
            )
        )
    ) ;
  }
}
