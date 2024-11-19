
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_project_session_11/config/theme/app_theme.dart';
import 'package:to_do_project_session_11/core/utils/route_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412,870),
      minTextAdapt: true,
      splitScreenMode: true,


      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesManager.router,

        initialRoute: RoutesManager.registRoute,
        theme: AppTheme.light,
        themeMode: ThemeMode.light,

      ),
    );

  }
}
