
import 'package:flutter/material.dart';
import 'package:to_do_project_session_11/core/utils/app_styel.dart';
import 'package:to_do_project_session_11/core/utils/colors_manager.dart';

class AppTheme{

  static ThemeData light=ThemeData(
    useMaterial3: false,
      primaryColor: ColorsManager.blue,
      colorScheme: ColorScheme.fromSeed(seedColor: ColorsManager.blue,
      primary: ColorsManager.blue,
        onPrimary: ColorsManager.white,
      ),
      appBarTheme: AppBarTheme(

          backgroundColor: ColorsManager.blue,
          titleTextStyle:AppLightStyles.appBarTextStyle
      ),
    scaffoldBackgroundColor: ColorsManager.Scaff_bg,
      bottomAppBarTheme: BottomAppBarTheme(

        color: ColorsManager.white,

        shape: CircularNotchedRectangle(),

      ),
      bottomNavigationBarTheme:  BottomNavigationBarThemeData(

        type: BottomNavigationBarType.fixed,
        backgroundColor:Colors.transparent,
        elevation: 0,

        selectedItemColor: ColorsManager.blue,
        unselectedItemColor: ColorsManager.grey,
      ),
       bottomSheetTheme: BottomSheetThemeData(
         elevation: 0,
         backgroundColor: Colors.white,
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.only(
             topRight: Radius.circular(20),
             topLeft: Radius.circular(20),
           )
         )
       ),
       floatingActionButtonTheme: FloatingActionButtonThemeData
         (

         iconSize: 33,
         backgroundColor: ColorsManager.blue,
         shape: StadiumBorder(side:
         BorderSide(color:ColorsManager.white ))
       ),
    //iconTheme: IconThemeData(color: ColorsManager.white,size: 40)
  );


}