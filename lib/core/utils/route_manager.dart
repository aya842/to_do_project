


import 'package:flutter/material.dart';
import 'package:to_do_project_session_11/presention/screens/home/home_screens.dart';
import 'package:to_do_project_session_11/presention/screens/splash/splash_screen.dart';

 class RoutesManager {
  static const String  SplashRoute='/splash';
  static const String  HomeRoute='/home';
  static  Route?router(RouteSettings settings){
    switch (settings.name)  {
      case HomeRoute:
        return MaterialPageRoute(
          builder: (context)=>HomeScreen(),
        );
      case SplashRoute:
        return MaterialPageRoute(
          builder: (context)=>SplasheScreen(),
        );

    }
  }
}