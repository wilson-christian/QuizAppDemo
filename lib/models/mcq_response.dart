import 'package:quiz_app/models/radio_item.dart';

class McqResponse {
  int responseCode;
  List<Mcq> results;

  McqResponse({this.responseCode, this.results});

  McqResponse.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'] as int;
    if (json['results'] != null) {
      results = <Mcq>[];

      json['results'].forEach((v) {
        results.add(Mcq.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response_code'] = responseCode;
    if (results != null) {
      data['results'] = results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Mcq {
  String category;
  String type;
  String difficulty;
  String question;
  String correctAnswer;
  List<dynamic> incorrectAnswers;
  List<RadioModel> allOption = [];

  Mcq(
      {this.category,
      this.type,
      this.difficulty,
      this.question,
      this.correctAnswer,
      this.incorrectAnswers});

  Mcq.fromJson(Map<String, dynamic> json) {
    category = json['category'] as String;
    type = json['type'] as String;
    difficulty = json['difficulty'] as String;
    question = json['question'] as String;
    correctAnswer = json['correct_answer'] as String;
    incorrectAnswers = json['incorrect_answers'] as List<dynamic>;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['type'] = type;
    data['difficulty'] = difficulty;
    data['question'] = question;
    data['correct_answer'] = correctAnswer;
    data['incorrect_answers'] = incorrectAnswers;
    return data;
  }
}
