


import 'package:flutter/material.dart';
import 'package:to_do_project_session_11/presention/screens/autho/login/login.dart';
import 'package:to_do_project_session_11/presention/screens/autho/regis/register.dart';
import 'package:to_do_project_session_11/presention/screens/home/home_screens.dart';
import 'package:to_do_project_session_11/presention/screens/splash/splash_screen.dart';

 class RoutesManager {
  static const String  SplashRoute='/splash';
  static const String  HomeRoute='/home';
  static const String  registRoute='/reg';
  static const String  LoginRoute='/login';

  static  Route?router(RouteSettings settings){
    switch (settings.name)  {
      case HomeRoute:
        return MaterialPageRoute(
          builder: (context)=> HomeScreen(),
        );
      case SplashRoute:
        return MaterialPageRoute(
          builder: (context)=> const SplasheScreen(),
        );
      case registRoute:
        return MaterialPageRoute(
          builder: (context)=> Registerion(),
        );
      case LoginRoute:
        return MaterialPageRoute(
          builder: (context)=>Login(),
        );

    }
  }
}