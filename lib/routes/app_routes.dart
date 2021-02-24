import 'package:get/get.dart';
import 'package:quiz_app/routes/app_routes_constant.dart';
import 'package:quiz_app/screens/home/home_screen.dart';
import 'package:quiz_app/screens/mcq/mcq_screen.dart';
import 'package:quiz_app/screens/result/result_screen.dart';

class AppRouter {
  static final route = [
    GetPage(
      name: routeHome,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: routeMcq,
      page: () => McqScreen(),
    ),
    GetPage(
      name: routeResult,
      page: () => ResultScreen(),
    ),
  ];
}
