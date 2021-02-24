import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/utility/app_colors.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: colorBackground,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: RawMaterialButton(
                  onPressed: () {
                    Get.back();
                  },
                  elevation: 1.0,
                  fillColor: Colors.white,
                  padding: const EdgeInsets.all(10.0),
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 25,
                    color: Colors.black87,
                  )),
            ),
            const SizedBox(height: 10),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 30, 12, 30),
                      child: Column(
                        children: [
                          const Text(
                            "Your score is",
                            style: TextStyle(fontSize: 26),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "${Get.arguments}",
                            style: const TextStyle(fontSize: 36),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
