
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_project_session_11/core/utils/app_styel.dart';
import 'package:to_do_project_session_11/core/utils/assests_manager.dart';
import 'package:to_do_project_session_11/core/utils/colors_manager.dart';
import 'package:to_do_project_session_11/core/utils/const_manager.dart';
import 'package:to_do_project_session_11/core/utils/dialog_util/dialog.dart';
import 'package:to_do_project_session_11/core/utils/email_validation.dart';
import 'package:to_do_project_session_11/core/utils/route_manager.dart';
import 'package:to_do_project_session_11/databaseManger/module/user_data_model.dart';
import 'package:to_do_project_session_11/presention/screens/autho/widget/custom_Text_Field.dart';

class Registerion  extends StatefulWidget {
   Registerion ({super.key});

  @override
  State<Registerion> createState() => _RegisterionState();
}

class _RegisterionState extends State<Registerion> {
  late TextEditingController FullName;

  late TextEditingController UserName;

  late TextEditingController Email;

  late TextEditingController Password;

  late TextEditingController repassward;
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FullName = TextEditingController();
    UserName = TextEditingController();
    Email = TextEditingController();
    Password = TextEditingController();
    repassward = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    FullName.dispose();
    UserName.dispose();
    Email.dispose();
    Password.dispose();
    repassward.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: ColorsManager.Scaff_bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              //mainAxisAlignment: ,
              children: [

                //SvgPicture.asset(AssestManger.Route_Picture,width: 237.w,height: 71.h,),
                Image.asset(
                    AssestManger.ToDo_Picture, width: 400.w, height: 150.h),

                Text('FullName', style: AppLightStyles.title,),
                SizedBox(height: 12.h,),
                CustomTextField(hintText: 'Enter your Full Name',
                    controller: FullName,
                    validator: (input) {
                      if (input == null || input
                          .trim()
                          .isEmpty) {
                        return 'Full Name is required';
                      }
                      return null;
                    },
                    keyboaredType: TextInputType.name),
                SizedBox(height: 10.h,),
                Text('UserName', style: AppLightStyles.title,),
                SizedBox(height: 10.h,),
                CustomTextField(hintText: 'Enter  User Name',
                    controller: UserName,
                    validator: (input) {
                      if (input == null || input
                          .trim()
                          .isEmpty) {
                        return ' User Name is required';
                      }
                      return null;
                    },
                    keyboaredType: TextInputType.name),
                SizedBox(height: 10.h,),
                Text('E-mail', style: AppLightStyles.title,),
                SizedBox(height: 10.h,),
                CustomTextField(hintText: 'Enter Your  Email',
                    controller: Email,
                    isScure: false,
                    validator: (input) {
                      if (input == null || input
                          .trim()
                          .isEmpty) {
                        return ' Email  is required';
                      }
                      if (!isVaildEmail(input)) {
                        return 'Format is not true ';
                      }
                    },
                    keyboaredType: TextInputType.emailAddress),
                SizedBox(height: 10.h,),
                Text('Passward', style: AppLightStyles.title,),
                SizedBox(height: 10.h,),
                CustomTextField(hintText: 'Enter Password',
                    controller: Password,
                    isScure: true,
                    validator: (input) {
                      if (input == null || input
                          .trim()
                          .isEmpty) {
                        return ' Passward is required';
                      }
                    },
                    keyboaredType: TextInputType.text),
                SizedBox(height: 10.h,),
                Text('Re-Passward', style: AppLightStyles.title,),
                SizedBox(height: 10.h,),
                CustomTextField(hintText: 'Confirm Password',
                    controller: repassward,
                    isScure: true,
                    validator: (input) {
                      if (input == null || input
                          .trim()
                          .isEmpty) {
                        return ' re-passward is required';
                      }
                      if (input != Password.text) {
                        return " Password doesn't match";
                      }

                    },
                    keyboaredType: TextInputType.visiblePassword),
                SizedBox(height: 10.h,),
                MaterialButton(
                  padding: EdgeInsets.symmetric(vertical: 11),
                  color: ColorsManager.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),

                  ),
                  onPressed: () {
                    signUp();
                  },
                  child: Text('Sign_Up',
                    style: AppLightStyles.title?.copyWith(fontSize: 16),
                  ),

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("already have Account"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, RoutesManager.LoginRoute);
                        },
                        child: Text(
                          'Login', style: AppLightStyles.Account?.copyWith(
                            decoration: TextDecoration.underline
                        ),)),


                  ],
                )


              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUp() async {
    if (formkey.currentState?.validate() == false)
    // DialogUtil.showLoading(context, message: 'Error');
    //  await Future.delayed(Duration(seconds: 3));
    // DialogUtil.hide(context);
    // DialogUtil.showMessage(context,Title: 'Error',posActionTitle: 'Ok',NevActionTitle: 'Cancel');

    try {
      DialogUtil.showLoading(context, message: 'Please Wait moment');
      UserCredential credential =
      await FirebaseAuth.instance.
      createUserWithEmailAndPassword(
        email: Email.text,
        password: Password.text,
      );
      addToFireStore(credential.user!.uid);
      if (mounted) {
        DialogUtil.hide(context);
      }
      DialogUtil.showMessage(context,body: 'Account Created Success',posActionTitle: 'ok',
          posAction: (){
        Navigator.pushReplacementNamed(context, RoutesManager.LoginRoute);
      }
      );
    }

    on FirebaseAuthException catch (authError) {
    late String message;
      if (authError.code == ConstManger.WeakPasswordCode) {
        message='The password provided is too weak.';
      } else if (authError.code == ConstManger.emailUse) {
        message='The account already exists for that email.';
      }
      DialogUtil.showMessage(context , Title: 'Error Happen',body: message,
          posActionTitle: 'ok');
    } catch (error) {
      DialogUtil.hide(context);
      DialogUtil.showMessage(context,Title: 'Error Happen',body:error.toString());
     // print(error);
    }
  }
  void addToFireStore( String uid) async{
    CollectionReference usercollection=FirebaseFirestore.instance.collection(UserDM.collectionName);
    DocumentReference userDoecument =usercollection.doc(uid);
    UserDM userDM=UserDM(Email: Email.text,
        FullName: FullName.text,
        UserName: UserName.text,
        id: uid);
     await  userDoecument.set(userDM.toFireStore());

  }
}
