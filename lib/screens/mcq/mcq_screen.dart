import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/mcq_controller.dart';

import 'package:quiz_app/custom/custom_radio_button.dart';
import 'package:quiz_app/models/radio_item.dart';
import 'package:quiz_app/routes/app_routes_constant.dart';
import 'package:quiz_app/utility/app_colors.dart';

class McqScreen extends StatelessWidget {
  final McqController mcqController = Get.put(McqController());
  final RxInt _pageIndex = 0.obs;
  final RxInt _correctAnswers = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      body: Obx(() {
        if (mcqController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10.0),
                    pageTitle(),
                    const SizedBox(height: 20.0),
                    questionSequence(),
                    //const SizedBox(height: 10.0),
                    question(),
                    const SizedBox(height: 10.0),
                    options(),
                    const SizedBox(height: 20.0),
                    btnNextContinue(),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
          );
        }
      }),
    );
  }

  Widget pageTitle() {
    return const Center(
      child: Text(
        "Questions",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget questionSequence() {
    final int pageNumber = _pageIndex.value + 1;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        text: TextSpan(
          text: '$pageNumber',
          style: TextStyle(
            fontSize: 22,
            color: colorPrimaryText,
            fontWeight: FontWeight.bold,
          ),
          children: <TextSpan>[
            TextSpan(
                text: '/',
                style: TextStyle(
                  fontSize: 16,
                  color: colorSecondaryText,
                )),
            TextSpan(
                text: '${mcqController.dataList.length}',
                style: TextStyle(
                  fontSize: 14,
                  color: colorSecondaryText,
                )),
          ],
        ),
      ),
    );
  }

  Widget question() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        mcqController.dataList[_pageIndex.value].question,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  Widget options() {
    prepareOptionList();

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: mcqController.dataList[_pageIndex.value].allOption.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            for (final item
                in mcqController.dataList[_pageIndex.value].allOption) {
              item.isSelected.value = false;
            }

            mcqController.dataList[_pageIndex.value].allOption[index].isSelected
                .value = true;
          },
          child: RadioItem(
              mcqController.dataList[_pageIndex.value].allOption[index]),
        );
      },
    );
  }

  String getBtnText(int index) {
    String value = "A";

    if (index == 1) {
      value = "B";
    } else if (index == 2) {
      value = "C";
    } else if (index == 3) {
      value = "D";
    }

    return value;
  }

  Widget btnNextContinue() {
    final int pageSize = mcqController.dataList.length;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: SizedBox(
          width: double.infinity,
          child: FlatButton(
            onPressed: () {
              if (checkIfAnyOptionIsSelected()) {
                if (_pageIndex.value < pageSize - 1) {
                  final String correctAns =
                      mcqController.dataList[_pageIndex.value].correctAnswer;

                  final String selectedAns = mcqController
                      .dataList[_pageIndex.value].allOption
                      .singleWhere(
                          (element) => element.isSelected.value == true)
                      .text;

                  if (correctAns.toLowerCase == selectedAns.toLowerCase) {
                    _correctAnswers.value = _correctAnswers.value + 1;
                  }

                  _pageIndex.value = _pageIndex.value + 1;
                  debugPrint("PAGE_NUM : $_pageIndex");
                } else {
                  Get.toNamed(routeResult, arguments: _correctAnswers.value);
                }
              } else {
                Get.snackbar("Select option", "Please select any one option");
              }
            },
            color: Colors.blueAccent,
            textColor: Colors.white,
            child: Text(_pageIndex.value == pageSize - 1 ? "Submit" : "Next"),
          ),
        ),
      ),
    );
  }

  void prepareOptionList() {
    final List<RadioModel> options = <RadioModel>[];
    final List<String> allOptions = [];
    final incorrectAnswers =
        mcqController.dataList[_pageIndex.value].incorrectAnswers;

    allOptions.assignAll(List.from(incorrectAnswers));
    allOptions.add(mcqController.dataList[_pageIndex.value].correctAnswer);
    allOptions.shuffle();

    for (var i = 0; i < allOptions.length; i++) {
      options.add(RadioModel(buttonText: getBtnText(i), text: allOptions[i]));
    }

    mcqController.dataList[_pageIndex.value].allOption.assignAll(options);
  }

  bool checkIfAnyOptionIsSelected() {
    bool result = false;

    for (var item in mcqController.dataList[_pageIndex.value].allOption) {
      if (item.isSelected.value) {
        result = true;
        break;
      }
    }

    return result;
  }
}
