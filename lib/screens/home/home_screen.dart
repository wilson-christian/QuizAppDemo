import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/routes/app_routes_constant.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: () {
            Get.toNamed(routeMcq);
          },
          child: const Text("Click Here"),
        ),
      ),
    );
  }
}
