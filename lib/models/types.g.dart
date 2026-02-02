// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnswerOption _$AnswerOptionFromJson(Map<String, dynamic> json) =>
    _AnswerOption(
      option: json['option'] as String? ?? '',
      isCorrect: json['isCorrect'] as bool? ?? false,
    );

Map<String, dynamic> _$AnswerOptionToJson(_AnswerOption instance) =>
    <String, dynamic>{
      'option': instance.option,
      'isCorrect': instance.isCorrect,
    };

_SubQuestionOption _$SubQuestionOptionFromJson(Map<String, dynamic> json) =>
    _SubQuestionOption(
      option: json['option'] as String? ?? '',
      isCorrect: json['isCorrect'] as bool? ?? false,
    );

Map<String, dynamic> _$SubQuestionOptionToJson(_SubQuestionOption instance) =>
    <String, dynamic>{
      'option': instance.option,
      'isCorrect': instance.isCorrect,
    };

_SubQuestion _$SubQuestionFromJson(Map<String, dynamic> json) => _SubQuestion(
  id: json['id'] as String,
  subquestion: json['subquestion'] as String? ?? '',
  options:
      (json['options'] as List<dynamic>?)
          ?.map((e) => SubQuestionOption.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  maxSelected: (json['maxSelected'] as num?)?.toInt() ?? 1,
);

Map<String, dynamic> _$SubQuestionToJson(_SubQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subquestion': instance.subquestion,
      'options': instance.options,
      'maxSelected': instance.maxSelected,
    };

_Question _$QuestionFromJson(Map<String, dynamic> json) => _Question(
  QuestionID: json['QuestionID'] as String,
  QuestionNumber: (json['QuestionNumber'] as num).toInt(),
  QuestionType: json['QuestionType'] as String,
  Chapter: json['Chapter'] as String,
  Topic: json['Topic'] as String,
  Grade: json['Grade'] as String,
  Level: json['Level'] as String,
  QuestionLatex: json['QuestionLatex'] as String? ?? '',
  QuestionImage: json['QuestionImage'] as String?,
  HintLatex: json['HintLatex'] as String? ?? '',
  SolutionLatex: json['SolutionLatex'] as String? ?? '',
  AnswersJSON: (json['AnswersJSON'] as List<dynamic>?)
      ?.map((e) => AnswerOption.fromJson(e as Map<String, dynamic>))
      .toList(),
  SubQuestions: (json['SubQuestions'] as List<dynamic>?)
      ?.map((e) => SubQuestion.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$QuestionToJson(_Question instance) => <String, dynamic>{
  'QuestionID': instance.QuestionID,
  'QuestionNumber': instance.QuestionNumber,
  'QuestionType': instance.QuestionType,
  'Chapter': instance.Chapter,
  'Topic': instance.Topic,
  'Grade': instance.Grade,
  'Level': instance.Level,
  'QuestionLatex': instance.QuestionLatex,
  'QuestionImage': instance.QuestionImage,
  'HintLatex': instance.HintLatex,
  'SolutionLatex': instance.SolutionLatex,
  'AnswersJSON': instance.AnswersJSON,
  'SubQuestions': instance.SubQuestions,
};
