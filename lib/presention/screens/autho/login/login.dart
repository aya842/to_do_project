
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

class Login  extends StatefulWidget {
  Login ({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  late  TextEditingController Email;
  late  TextEditingController Password;

  GlobalKey<FormState> formkey=GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Email = TextEditingController();
    Password = TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    Email.dispose();
    Password.dispose();

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
            key:formkey ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              //mainAxisAlignment: ,
              children: [

                //SvgPicture.asset(AssestManger.Route_Picture,width: 237.w,height: 71.h,),
                Image.asset(AssestManger.ToDo_Picture,width: 400.w,height: 150.h),

                Text('E-mail',style: AppLightStyles.title,),
                SizedBox(height: 10.h,),
                CustomTextField(hintText: 'Enter Your  Email',
                    controller:Email ,
                    isScure: false,
                    validator: (input){
                      if (input==null || input.trim().isEmpty){
                        return ' Email  is required';
                      }
                      if(!isVaildEmail(input)){
                        return 'Format is not true ';

                      }


                    },
                    keyboaredType: TextInputType.emailAddress),
                SizedBox(height: 10.h,),
                Text('Passward',style: AppLightStyles.title,),
                SizedBox(height: 10.h,),
                CustomTextField(hintText: 'Enter Password',
                    isScure: true,
                    controller:Password ,
                    validator: (input){
                      if (input==null || input.trim().isEmpty){
                        return ' Passward is required';
                      }
                      return null;

                    },
                    keyboaredType: TextInputType.text),
                SizedBox(height: 10.h,),
                SizedBox(height: 10.h,),

                SizedBox(height: 10.h,),
                MaterialButton(padding: EdgeInsets.symmetric(vertical: 11),
                  color: ColorsManager.white,
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),

                  ),
                  onPressed: (){
                    Login();
                  },
                  child: Text('Login',style: AppLightStyles.title?.copyWith(fontSize:16 ),
                  ),

                ),
                Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't Have account?"),
                    TextButton(
                        onPressed: (){
                          Navigator.pushReplacementNamed(context, RoutesManager.registRoute);
                        },
                        child: Text(
                        'Create Acoount',style:AppLightStyles.Account?.copyWith(
                          decoration: TextDecoration.underline
                        ), )),




                  ],
                )


              ],
            ),
          ),
        ),
      ),
    );
  }

  // void Login() async {
  //   if (formkey.currentState?.validate() == false)
  //     // DialogUtil.showLoading(context, message: 'Error');
  //     //  await Future.delayed(Duration(seconds: 3));
  //     // DialogUtil.hide(context);
  //     // DialogUtil.showMessage(context,Title: 'Error',posActionTitle: 'Ok',NevActionTitle: 'Cancel');
  //
  //     try {
  //       DialogUtil.showLoading(context, message: 'Please Wait moment');
  //       UserCredential credential =
  //       await FirebaseAuth.instance.
  //       signInWithEmailAndPassword(
  //         email: Email.text,
  //         password: Password.text,
  //       );
  //       if (mounted) {
  //         DialogUtil.hide(context);
  //       }
  //       DialogUtil.showMessage(context,body: 'Login Success',posActionTitle: 'ok',
  //           posAction: (){
  //             Navigator.pushReplacementNamed(context, RoutesManager.HomeRoute);
  //           }
  //       );
  //     }
  //     on FirebaseAuthException catch (authError) {
  //       late String message;
  //       if (authError.code == ConstManger.InvalidCre) {
  //         message='Wrong Email or Passward.';
  //       }
  //       DialogUtil.showMessage(context , Title: 'Error Happen',body: message,
  //           posActionTitle: 'ok');
  //     } catch (error) {
  //       DialogUtil.hide(context);
  //       DialogUtil.showMessage(context,Title: 'Error Happen',body:error.toString());
  //       // print(error);
  //     }
  // }
  void Login() async {
    if (!formkey.currentState!.validate()) {
      return; // Stop execution if form is invalid
    }

    try {
      DialogUtil.showLoading(context, message: 'Please wait a moment');
      UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: Email.text, // Trim whitespace
        password: Password.text,
      );
      UserDM .currentuser= await readUserFromFirestore(credential.user!.uid);

      if (mounted) {
        DialogUtil.hide(context);
      }
      DialogUtil.showMessage(
        context,
        body: 'Login Successful',
        posActionTitle: 'OK',
        posAction: () {
          Navigator.pushReplacementNamed(context, RoutesManager.HomeRoute);
        },
      );
    } on FirebaseAuthException catch (authError) {
      late String message;
      if (authError.code == 'user-not-found' || authError.code == 'wrong-password') {
        message = 'Wrong Email or Password.';
      } else {
        message = 'An unexpected error occurred.';
      }
      if (mounted) {
        DialogUtil.hide(context);
      }
      DialogUtil.showMessage(
        context,
        Title: 'Error Occurred',
        body: message,
        posActionTitle: 'OK',
      );
    } catch (error) {
      if (mounted) {
        DialogUtil.hide(context);
      }
      DialogUtil.showMessage(
        context,
        Title: 'Error Occurred',
        body: error.toString(),
      );
      print('Error: $error');
      // Debugging
    }
  }
  readUserFromFirestore( String uid) async{
      CollectionReference userColl= FirebaseFirestore.instance.collection(UserDM.collectionName);
     DocumentReference DocUser= userColl.doc( uid);
     DocumentSnapshot UserDocSnapShot=  await DocUser.get();
     Map<String,dynamic> json= UserDocSnapShot.data() as Map<String,dynamic>;
      UserDM userDm= UserDM.fromFirestore(json);
      return userDm;


  }


}
