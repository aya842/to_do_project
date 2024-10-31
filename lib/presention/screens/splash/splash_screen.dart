
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:to_do_project_session_11/core/utils/assests_manager.dart';
import 'package:to_do_project_session_11/core/utils/colors_manager.dart';
import 'package:to_do_project_session_11/core/utils/route_manager.dart';

class SplasheScreen extends StatefulWidget {
  const SplasheScreen({super.key});

  @override
  State<SplasheScreen> createState() => _SplasheScreenState();
}

class _SplasheScreenState extends State<SplasheScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, RoutesManager.HomeRoute);
    });
  }
  @override
  Widget build(BuildContext context) {

    
    return Container(
      color: ColorsManager.Scaff_bg,
      child :Column(
        children: [
          Expanded

            (flex: 3,
              child: Image.asset(AssestManger.logo_splash,
              height:221, width: 190,),),
          Expanded(
            flex: 1,
              child: Image.asset(AssestManger.logo_Route),
          )],
      )
    );
  }
}
