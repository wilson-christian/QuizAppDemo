import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/routes/app_routes.dart';
import 'package:quiz_app/routes/app_routes_constant.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
      getPages: AppRouter.route,
      theme: ThemeData(
        textTheme: GoogleFonts.rubikTextTheme(
          Theme.of(context).textTheme,
        ),
        primaryColor: const Color(0xff01046d),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: routeMcq,
    );
  }
}
