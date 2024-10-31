
import 'package:flutter/material.dart';
import 'package:to_do_project_session_11/config/theme/app_theme.dart';
import 'package:to_do_project_session_11/core/utils/route_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesManager.router,

      initialRoute: RoutesManager.SplashRoute,
      theme: AppTheme.light,
      themeMode: ThemeMode.light,

    );

  }
}
