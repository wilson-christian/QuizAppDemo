import 'package:get/state_manager.dart';

class RadioModel {
  final String buttonText;
  final String text;

  RadioModel({this.buttonText, this.text});

  final isSelected = false.obs;
}
