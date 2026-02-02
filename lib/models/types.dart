
import 'package:freezed_annotation/freezed_annotation.dart';

part 'types.freezed.dart';
part 'types.g.dart';

@freezed
abstract class AnswerOption with _$AnswerOption {
  const factory AnswerOption({
    @Default('') String option,
    @Default(false) bool isCorrect,
  }) = _AnswerOption;

  factory AnswerOption.fromJson(Map<String, dynamic> json) => _$AnswerOptionFromJson(json);
}

@freezed
abstract class SubQuestionOption with _$SubQuestionOption {
  const factory SubQuestionOption({
    @Default('') String option,
    @Default(false) bool isCorrect,
  }) = _SubQuestionOption;

  factory SubQuestionOption.fromJson(Map<String, dynamic> json) => _$SubQuestionOptionFromJson(json);
}

@freezed
abstract class SubQuestion with _$SubQuestion {
  const factory SubQuestion({
    required String id,
    @Default('') String subquestion,
    @Default([]) List<SubQuestionOption> options,
    @Default(1) int maxSelected,
  }) = _SubQuestion;

  factory SubQuestion.fromJson(Map<String, dynamic> json) => _$SubQuestionFromJson(json);
}

@freezed
abstract class Question with _$Question {
  const factory Question({
    required String QuestionID,
    required int QuestionNumber,
    required String QuestionType,
    required String Chapter,
    required String Topic,
    required String Grade,
    required String Level,
    @Default('') String QuestionLatex,
    String? QuestionImage,
    @Default('') String HintLatex,
    @Default('') String SolutionLatex,
    List<AnswerOption>? AnswersJSON,
    List<SubQuestion>? SubQuestions,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
}
