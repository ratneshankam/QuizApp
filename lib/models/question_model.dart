import 'package:flutter/material.dart';

class QuestionModel {
  final String question;
  final List<String> options;
  final int answerIndex;
  final String description;

  const QuestionModel({
    required this.question,
    required this.options,
    required this.answerIndex,
    required this.description,
  }) : assert(
          answerIndex >= 0 && answerIndex < options.length,
          "answerIndex must be within options range",
        );
}

class QuizTopic {
  final String topicName;
  final String description;
  final IconData icon;
  final Color color;
  final List<QuestionModel> questions;

  const QuizTopic({
    required this.topicName,
    required this.description,
    required this.icon,
    required this.color,
    required this.questions,
  });
}

enum QuizScreenState {
  intro,
  active,
  result,
}