// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnswerOption {

 String get option; bool get isCorrect;
/// Create a copy of AnswerOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnswerOptionCopyWith<AnswerOption> get copyWith => _$AnswerOptionCopyWithImpl<AnswerOption>(this as AnswerOption, _$identity);

  /// Serializes this AnswerOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnswerOption&&(identical(other.option, option) || other.option == option)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,option,isCorrect);

@override
String toString() {
  return 'AnswerOption(option: $option, isCorrect: $isCorrect)';
}


}

/// @nodoc
abstract mixin class $AnswerOptionCopyWith<$Res>  {
  factory $AnswerOptionCopyWith(AnswerOption value, $Res Function(AnswerOption) _then) = _$AnswerOptionCopyWithImpl;
@useResult
$Res call({
 String option, bool isCorrect
});




}
/// @nodoc
class _$AnswerOptionCopyWithImpl<$Res>
    implements $AnswerOptionCopyWith<$Res> {
  _$AnswerOptionCopyWithImpl(this._self, this._then);

  final AnswerOption _self;
  final $Res Function(AnswerOption) _then;

/// Create a copy of AnswerOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? option = null,Object? isCorrect = null,}) {
  return _then(_self.copyWith(
option: null == option ? _self.option : option // ignore: cast_nullable_to_non_nullable
as String,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AnswerOption].
extension AnswerOptionPatterns on AnswerOption {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnswerOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnswerOption() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnswerOption value)  $default,){
final _that = this;
switch (_that) {
case _AnswerOption():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnswerOption value)?  $default,){
final _that = this;
switch (_that) {
case _AnswerOption() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String option,  bool isCorrect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnswerOption() when $default != null:
return $default(_that.option,_that.isCorrect);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String option,  bool isCorrect)  $default,) {final _that = this;
switch (_that) {
case _AnswerOption():
return $default(_that.option,_that.isCorrect);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String option,  bool isCorrect)?  $default,) {final _that = this;
switch (_that) {
case _AnswerOption() when $default != null:
return $default(_that.option,_that.isCorrect);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnswerOption implements AnswerOption {
  const _AnswerOption({this.option = '', this.isCorrect = false});
  factory _AnswerOption.fromJson(Map<String, dynamic> json) => _$AnswerOptionFromJson(json);

@override@JsonKey() final  String option;
@override@JsonKey() final  bool isCorrect;

/// Create a copy of AnswerOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnswerOptionCopyWith<_AnswerOption> get copyWith => __$AnswerOptionCopyWithImpl<_AnswerOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnswerOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnswerOption&&(identical(other.option, option) || other.option == option)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,option,isCorrect);

@override
String toString() {
  return 'AnswerOption(option: $option, isCorrect: $isCorrect)';
}


}

/// @nodoc
abstract mixin class _$AnswerOptionCopyWith<$Res> implements $AnswerOptionCopyWith<$Res> {
  factory _$AnswerOptionCopyWith(_AnswerOption value, $Res Function(_AnswerOption) _then) = __$AnswerOptionCopyWithImpl;
@override @useResult
$Res call({
 String option, bool isCorrect
});




}
/// @nodoc
class __$AnswerOptionCopyWithImpl<$Res>
    implements _$AnswerOptionCopyWith<$Res> {
  __$AnswerOptionCopyWithImpl(this._self, this._then);

  final _AnswerOption _self;
  final $Res Function(_AnswerOption) _then;

/// Create a copy of AnswerOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? option = null,Object? isCorrect = null,}) {
  return _then(_AnswerOption(
option: null == option ? _self.option : option // ignore: cast_nullable_to_non_nullable
as String,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$SubQuestionOption {

 String get option; bool get isCorrect;
/// Create a copy of SubQuestionOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubQuestionOptionCopyWith<SubQuestionOption> get copyWith => _$SubQuestionOptionCopyWithImpl<SubQuestionOption>(this as SubQuestionOption, _$identity);

  /// Serializes this SubQuestionOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubQuestionOption&&(identical(other.option, option) || other.option == option)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,option,isCorrect);

@override
String toString() {
  return 'SubQuestionOption(option: $option, isCorrect: $isCorrect)';
}


}

/// @nodoc
abstract mixin class $SubQuestionOptionCopyWith<$Res>  {
  factory $SubQuestionOptionCopyWith(SubQuestionOption value, $Res Function(SubQuestionOption) _then) = _$SubQuestionOptionCopyWithImpl;
@useResult
$Res call({
 String option, bool isCorrect
});




}
/// @nodoc
class _$SubQuestionOptionCopyWithImpl<$Res>
    implements $SubQuestionOptionCopyWith<$Res> {
  _$SubQuestionOptionCopyWithImpl(this._self, this._then);

  final SubQuestionOption _self;
  final $Res Function(SubQuestionOption) _then;

/// Create a copy of SubQuestionOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? option = null,Object? isCorrect = null,}) {
  return _then(_self.copyWith(
option: null == option ? _self.option : option // ignore: cast_nullable_to_non_nullable
as String,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SubQuestionOption].
extension SubQuestionOptionPatterns on SubQuestionOption {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubQuestionOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubQuestionOption() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubQuestionOption value)  $default,){
final _that = this;
switch (_that) {
case _SubQuestionOption():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubQuestionOption value)?  $default,){
final _that = this;
switch (_that) {
case _SubQuestionOption() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String option,  bool isCorrect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubQuestionOption() when $default != null:
return $default(_that.option,_that.isCorrect);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String option,  bool isCorrect)  $default,) {final _that = this;
switch (_that) {
case _SubQuestionOption():
return $default(_that.option,_that.isCorrect);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String option,  bool isCorrect)?  $default,) {final _that = this;
switch (_that) {
case _SubQuestionOption() when $default != null:
return $default(_that.option,_that.isCorrect);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubQuestionOption implements SubQuestionOption {
  const _SubQuestionOption({this.option = '', this.isCorrect = false});
  factory _SubQuestionOption.fromJson(Map<String, dynamic> json) => _$SubQuestionOptionFromJson(json);

@override@JsonKey() final  String option;
@override@JsonKey() final  bool isCorrect;

/// Create a copy of SubQuestionOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubQuestionOptionCopyWith<_SubQuestionOption> get copyWith => __$SubQuestionOptionCopyWithImpl<_SubQuestionOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubQuestionOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubQuestionOption&&(identical(other.option, option) || other.option == option)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,option,isCorrect);

@override
String toString() {
  return 'SubQuestionOption(option: $option, isCorrect: $isCorrect)';
}


}

/// @nodoc
abstract mixin class _$SubQuestionOptionCopyWith<$Res> implements $SubQuestionOptionCopyWith<$Res> {
  factory _$SubQuestionOptionCopyWith(_SubQuestionOption value, $Res Function(_SubQuestionOption) _then) = __$SubQuestionOptionCopyWithImpl;
@override @useResult
$Res call({
 String option, bool isCorrect
});




}
/// @nodoc
class __$SubQuestionOptionCopyWithImpl<$Res>
    implements _$SubQuestionOptionCopyWith<$Res> {
  __$SubQuestionOptionCopyWithImpl(this._self, this._then);

  final _SubQuestionOption _self;
  final $Res Function(_SubQuestionOption) _then;

/// Create a copy of SubQuestionOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? option = null,Object? isCorrect = null,}) {
  return _then(_SubQuestionOption(
option: null == option ? _self.option : option // ignore: cast_nullable_to_non_nullable
as String,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$SubQuestion {

 String get id; String get subquestion; List<SubQuestionOption> get options; int get maxSelected;
/// Create a copy of SubQuestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubQuestionCopyWith<SubQuestion> get copyWith => _$SubQuestionCopyWithImpl<SubQuestion>(this as SubQuestion, _$identity);

  /// Serializes this SubQuestion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubQuestion&&(identical(other.id, id) || other.id == id)&&(identical(other.subquestion, subquestion) || other.subquestion == subquestion)&&const DeepCollectionEquality().equals(other.options, options)&&(identical(other.maxSelected, maxSelected) || other.maxSelected == maxSelected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,subquestion,const DeepCollectionEquality().hash(options),maxSelected);

@override
String toString() {
  return 'SubQuestion(id: $id, subquestion: $subquestion, options: $options, maxSelected: $maxSelected)';
}


}

/// @nodoc
abstract mixin class $SubQuestionCopyWith<$Res>  {
  factory $SubQuestionCopyWith(SubQuestion value, $Res Function(SubQuestion) _then) = _$SubQuestionCopyWithImpl;
@useResult
$Res call({
 String id, String subquestion, List<SubQuestionOption> options, int maxSelected
});




}
/// @nodoc
class _$SubQuestionCopyWithImpl<$Res>
    implements $SubQuestionCopyWith<$Res> {
  _$SubQuestionCopyWithImpl(this._self, this._then);

  final SubQuestion _self;
  final $Res Function(SubQuestion) _then;

/// Create a copy of SubQuestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? subquestion = null,Object? options = null,Object? maxSelected = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,subquestion: null == subquestion ? _self.subquestion : subquestion // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<SubQuestionOption>,maxSelected: null == maxSelected ? _self.maxSelected : maxSelected // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SubQuestion].
extension SubQuestionPatterns on SubQuestion {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubQuestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubQuestion() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubQuestion value)  $default,){
final _that = this;
switch (_that) {
case _SubQuestion():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubQuestion value)?  $default,){
final _that = this;
switch (_that) {
case _SubQuestion() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String subquestion,  List<SubQuestionOption> options,  int maxSelected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubQuestion() when $default != null:
return $default(_that.id,_that.subquestion,_that.options,_that.maxSelected);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String subquestion,  List<SubQuestionOption> options,  int maxSelected)  $default,) {final _that = this;
switch (_that) {
case _SubQuestion():
return $default(_that.id,_that.subquestion,_that.options,_that.maxSelected);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String subquestion,  List<SubQuestionOption> options,  int maxSelected)?  $default,) {final _that = this;
switch (_that) {
case _SubQuestion() when $default != null:
return $default(_that.id,_that.subquestion,_that.options,_that.maxSelected);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubQuestion implements SubQuestion {
  const _SubQuestion({required this.id, this.subquestion = '', final  List<SubQuestionOption> options = const [], this.maxSelected = 1}): _options = options;
  factory _SubQuestion.fromJson(Map<String, dynamic> json) => _$SubQuestionFromJson(json);

@override final  String id;
@override@JsonKey() final  String subquestion;
 final  List<SubQuestionOption> _options;
@override@JsonKey() List<SubQuestionOption> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

@override@JsonKey() final  int maxSelected;

/// Create a copy of SubQuestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubQuestionCopyWith<_SubQuestion> get copyWith => __$SubQuestionCopyWithImpl<_SubQuestion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubQuestionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubQuestion&&(identical(other.id, id) || other.id == id)&&(identical(other.subquestion, subquestion) || other.subquestion == subquestion)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.maxSelected, maxSelected) || other.maxSelected == maxSelected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,subquestion,const DeepCollectionEquality().hash(_options),maxSelected);

@override
String toString() {
  return 'SubQuestion(id: $id, subquestion: $subquestion, options: $options, maxSelected: $maxSelected)';
}


}

/// @nodoc
abstract mixin class _$SubQuestionCopyWith<$Res> implements $SubQuestionCopyWith<$Res> {
  factory _$SubQuestionCopyWith(_SubQuestion value, $Res Function(_SubQuestion) _then) = __$SubQuestionCopyWithImpl;
@override @useResult
$Res call({
 String id, String subquestion, List<SubQuestionOption> options, int maxSelected
});




}
/// @nodoc
class __$SubQuestionCopyWithImpl<$Res>
    implements _$SubQuestionCopyWith<$Res> {
  __$SubQuestionCopyWithImpl(this._self, this._then);

  final _SubQuestion _self;
  final $Res Function(_SubQuestion) _then;

/// Create a copy of SubQuestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? subquestion = null,Object? options = null,Object? maxSelected = null,}) {
  return _then(_SubQuestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,subquestion: null == subquestion ? _self.subquestion : subquestion // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<SubQuestionOption>,maxSelected: null == maxSelected ? _self.maxSelected : maxSelected // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Question {

 String get QuestionID; int get QuestionNumber; String get QuestionType; String get Chapter; String get Topic; String get Grade; String get Level; String get QuestionLatex; String? get QuestionImage; String get HintLatex; String get SolutionLatex; List<AnswerOption>? get AnswersJSON; List<SubQuestion>? get SubQuestions;
/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionCopyWith<Question> get copyWith => _$QuestionCopyWithImpl<Question>(this as Question, _$identity);

  /// Serializes this Question to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Question&&(identical(other.QuestionID, QuestionID) || other.QuestionID == QuestionID)&&(identical(other.QuestionNumber, QuestionNumber) || other.QuestionNumber == QuestionNumber)&&(identical(other.QuestionType, QuestionType) || other.QuestionType == QuestionType)&&(identical(other.Chapter, Chapter) || other.Chapter == Chapter)&&(identical(other.Topic, Topic) || other.Topic == Topic)&&(identical(other.Grade, Grade) || other.Grade == Grade)&&(identical(other.Level, Level) || other.Level == Level)&&(identical(other.QuestionLatex, QuestionLatex) || other.QuestionLatex == QuestionLatex)&&(identical(other.QuestionImage, QuestionImage) || other.QuestionImage == QuestionImage)&&(identical(other.HintLatex, HintLatex) || other.HintLatex == HintLatex)&&(identical(other.SolutionLatex, SolutionLatex) || other.SolutionLatex == SolutionLatex)&&const DeepCollectionEquality().equals(other.AnswersJSON, AnswersJSON)&&const DeepCollectionEquality().equals(other.SubQuestions, SubQuestions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,QuestionID,QuestionNumber,QuestionType,Chapter,Topic,Grade,Level,QuestionLatex,QuestionImage,HintLatex,SolutionLatex,const DeepCollectionEquality().hash(AnswersJSON),const DeepCollectionEquality().hash(SubQuestions));

@override
String toString() {
  return 'Question(QuestionID: $QuestionID, QuestionNumber: $QuestionNumber, QuestionType: $QuestionType, Chapter: $Chapter, Topic: $Topic, Grade: $Grade, Level: $Level, QuestionLatex: $QuestionLatex, QuestionImage: $QuestionImage, HintLatex: $HintLatex, SolutionLatex: $SolutionLatex, AnswersJSON: $AnswersJSON, SubQuestions: $SubQuestions)';
}


}

/// @nodoc
abstract mixin class $QuestionCopyWith<$Res>  {
  factory $QuestionCopyWith(Question value, $Res Function(Question) _then) = _$QuestionCopyWithImpl;
@useResult
$Res call({
 String QuestionID, int QuestionNumber, String QuestionType, String Chapter, String Topic, String Grade, String Level, String QuestionLatex, String? QuestionImage, String HintLatex, String SolutionLatex, List<AnswerOption>? AnswersJSON, List<SubQuestion>? SubQuestions
});




}
/// @nodoc
class _$QuestionCopyWithImpl<$Res>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._self, this._then);

  final Question _self;
  final $Res Function(Question) _then;

/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? QuestionID = null,Object? QuestionNumber = null,Object? QuestionType = null,Object? Chapter = null,Object? Topic = null,Object? Grade = null,Object? Level = null,Object? QuestionLatex = null,Object? QuestionImage = freezed,Object? HintLatex = null,Object? SolutionLatex = null,Object? AnswersJSON = freezed,Object? SubQuestions = freezed,}) {
  return _then(_self.copyWith(
QuestionID: null == QuestionID ? _self.QuestionID : QuestionID // ignore: cast_nullable_to_non_nullable
as String,QuestionNumber: null == QuestionNumber ? _self.QuestionNumber : QuestionNumber // ignore: cast_nullable_to_non_nullable
as int,QuestionType: null == QuestionType ? _self.QuestionType : QuestionType // ignore: cast_nullable_to_non_nullable
as String,Chapter: null == Chapter ? _self.Chapter : Chapter // ignore: cast_nullable_to_non_nullable
as String,Topic: null == Topic ? _self.Topic : Topic // ignore: cast_nullable_to_non_nullable
as String,Grade: null == Grade ? _self.Grade : Grade // ignore: cast_nullable_to_non_nullable
as String,Level: null == Level ? _self.Level : Level // ignore: cast_nullable_to_non_nullable
as String,QuestionLatex: null == QuestionLatex ? _self.QuestionLatex : QuestionLatex // ignore: cast_nullable_to_non_nullable
as String,QuestionImage: freezed == QuestionImage ? _self.QuestionImage : QuestionImage // ignore: cast_nullable_to_non_nullable
as String?,HintLatex: null == HintLatex ? _self.HintLatex : HintLatex // ignore: cast_nullable_to_non_nullable
as String,SolutionLatex: null == SolutionLatex ? _self.SolutionLatex : SolutionLatex // ignore: cast_nullable_to_non_nullable
as String,AnswersJSON: freezed == AnswersJSON ? _self.AnswersJSON : AnswersJSON // ignore: cast_nullable_to_non_nullable
as List<AnswerOption>?,SubQuestions: freezed == SubQuestions ? _self.SubQuestions : SubQuestions // ignore: cast_nullable_to_non_nullable
as List<SubQuestion>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Question].
extension QuestionPatterns on Question {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Question value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Question() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Question value)  $default,){
final _that = this;
switch (_that) {
case _Question():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Question value)?  $default,){
final _that = this;
switch (_that) {
case _Question() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String QuestionID,  int QuestionNumber,  String QuestionType,  String Chapter,  String Topic,  String Grade,  String Level,  String QuestionLatex,  String? QuestionImage,  String HintLatex,  String SolutionLatex,  List<AnswerOption>? AnswersJSON,  List<SubQuestion>? SubQuestions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Question() when $default != null:
return $default(_that.QuestionID,_that.QuestionNumber,_that.QuestionType,_that.Chapter,_that.Topic,_that.Grade,_that.Level,_that.QuestionLatex,_that.QuestionImage,_that.HintLatex,_that.SolutionLatex,_that.AnswersJSON,_that.SubQuestions);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String QuestionID,  int QuestionNumber,  String QuestionType,  String Chapter,  String Topic,  String Grade,  String Level,  String QuestionLatex,  String? QuestionImage,  String HintLatex,  String SolutionLatex,  List<AnswerOption>? AnswersJSON,  List<SubQuestion>? SubQuestions)  $default,) {final _that = this;
switch (_that) {
case _Question():
return $default(_that.QuestionID,_that.QuestionNumber,_that.QuestionType,_that.Chapter,_that.Topic,_that.Grade,_that.Level,_that.QuestionLatex,_that.QuestionImage,_that.HintLatex,_that.SolutionLatex,_that.AnswersJSON,_that.SubQuestions);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String QuestionID,  int QuestionNumber,  String QuestionType,  String Chapter,  String Topic,  String Grade,  String Level,  String QuestionLatex,  String? QuestionImage,  String HintLatex,  String SolutionLatex,  List<AnswerOption>? AnswersJSON,  List<SubQuestion>? SubQuestions)?  $default,) {final _that = this;
switch (_that) {
case _Question() when $default != null:
return $default(_that.QuestionID,_that.QuestionNumber,_that.QuestionType,_that.Chapter,_that.Topic,_that.Grade,_that.Level,_that.QuestionLatex,_that.QuestionImage,_that.HintLatex,_that.SolutionLatex,_that.AnswersJSON,_that.SubQuestions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Question implements Question {
  const _Question({required this.QuestionID, required this.QuestionNumber, required this.QuestionType, required this.Chapter, required this.Topic, required this.Grade, required this.Level, this.QuestionLatex = '', this.QuestionImage, this.HintLatex = '', this.SolutionLatex = '', final  List<AnswerOption>? AnswersJSON, final  List<SubQuestion>? SubQuestions}): _AnswersJSON = AnswersJSON,_SubQuestions = SubQuestions;
  factory _Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);

@override final  String QuestionID;
@override final  int QuestionNumber;
@override final  String QuestionType;
@override final  String Chapter;
@override final  String Topic;
@override final  String Grade;
@override final  String Level;
@override@JsonKey() final  String QuestionLatex;
@override final  String? QuestionImage;
@override@JsonKey() final  String HintLatex;
@override@JsonKey() final  String SolutionLatex;
 final  List<AnswerOption>? _AnswersJSON;
@override List<AnswerOption>? get AnswersJSON {
  final value = _AnswersJSON;
  if (value == null) return null;
  if (_AnswersJSON is EqualUnmodifiableListView) return _AnswersJSON;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<SubQuestion>? _SubQuestions;
@override List<SubQuestion>? get SubQuestions {
  final value = _SubQuestions;
  if (value == null) return null;
  if (_SubQuestions is EqualUnmodifiableListView) return _SubQuestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestionCopyWith<_Question> get copyWith => __$QuestionCopyWithImpl<_Question>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuestionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Question&&(identical(other.QuestionID, QuestionID) || other.QuestionID == QuestionID)&&(identical(other.QuestionNumber, QuestionNumber) || other.QuestionNumber == QuestionNumber)&&(identical(other.QuestionType, QuestionType) || other.QuestionType == QuestionType)&&(identical(other.Chapter, Chapter) || other.Chapter == Chapter)&&(identical(other.Topic, Topic) || other.Topic == Topic)&&(identical(other.Grade, Grade) || other.Grade == Grade)&&(identical(other.Level, Level) || other.Level == Level)&&(identical(other.QuestionLatex, QuestionLatex) || other.QuestionLatex == QuestionLatex)&&(identical(other.QuestionImage, QuestionImage) || other.QuestionImage == QuestionImage)&&(identical(other.HintLatex, HintLatex) || other.HintLatex == HintLatex)&&(identical(other.SolutionLatex, SolutionLatex) || other.SolutionLatex == SolutionLatex)&&const DeepCollectionEquality().equals(other._AnswersJSON, _AnswersJSON)&&const DeepCollectionEquality().equals(other._SubQuestions, _SubQuestions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,QuestionID,QuestionNumber,QuestionType,Chapter,Topic,Grade,Level,QuestionLatex,QuestionImage,HintLatex,SolutionLatex,const DeepCollectionEquality().hash(_AnswersJSON),const DeepCollectionEquality().hash(_SubQuestions));

@override
String toString() {
  return 'Question(QuestionID: $QuestionID, QuestionNumber: $QuestionNumber, QuestionType: $QuestionType, Chapter: $Chapter, Topic: $Topic, Grade: $Grade, Level: $Level, QuestionLatex: $QuestionLatex, QuestionImage: $QuestionImage, HintLatex: $HintLatex, SolutionLatex: $SolutionLatex, AnswersJSON: $AnswersJSON, SubQuestions: $SubQuestions)';
}


}

/// @nodoc
abstract mixin class _$QuestionCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory _$QuestionCopyWith(_Question value, $Res Function(_Question) _then) = __$QuestionCopyWithImpl;
@override @useResult
$Res call({
 String QuestionID, int QuestionNumber, String QuestionType, String Chapter, String Topic, String Grade, String Level, String QuestionLatex, String? QuestionImage, String HintLatex, String SolutionLatex, List<AnswerOption>? AnswersJSON, List<SubQuestion>? SubQuestions
});




}
/// @nodoc
class __$QuestionCopyWithImpl<$Res>
    implements _$QuestionCopyWith<$Res> {
  __$QuestionCopyWithImpl(this._self, this._then);

  final _Question _self;
  final $Res Function(_Question) _then;

/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? QuestionID = null,Object? QuestionNumber = null,Object? QuestionType = null,Object? Chapter = null,Object? Topic = null,Object? Grade = null,Object? Level = null,Object? QuestionLatex = null,Object? QuestionImage = freezed,Object? HintLatex = null,Object? SolutionLatex = null,Object? AnswersJSON = freezed,Object? SubQuestions = freezed,}) {
  return _then(_Question(
QuestionID: null == QuestionID ? _self.QuestionID : QuestionID // ignore: cast_nullable_to_non_nullable
as String,QuestionNumber: null == QuestionNumber ? _self.QuestionNumber : QuestionNumber // ignore: cast_nullable_to_non_nullable
as int,QuestionType: null == QuestionType ? _self.QuestionType : QuestionType // ignore: cast_nullable_to_non_nullable
as String,Chapter: null == Chapter ? _self.Chapter : Chapter // ignore: cast_nullable_to_non_nullable
as String,Topic: null == Topic ? _self.Topic : Topic // ignore: cast_nullable_to_non_nullable
as String,Grade: null == Grade ? _self.Grade : Grade // ignore: cast_nullable_to_non_nullable
as String,Level: null == Level ? _self.Level : Level // ignore: cast_nullable_to_non_nullable
as String,QuestionLatex: null == QuestionLatex ? _self.QuestionLatex : QuestionLatex // ignore: cast_nullable_to_non_nullable
as String,QuestionImage: freezed == QuestionImage ? _self.QuestionImage : QuestionImage // ignore: cast_nullable_to_non_nullable
as String?,HintLatex: null == HintLatex ? _self.HintLatex : HintLatex // ignore: cast_nullable_to_non_nullable
as String,SolutionLatex: null == SolutionLatex ? _self.SolutionLatex : SolutionLatex // ignore: cast_nullable_to_non_nullable
as String,AnswersJSON: freezed == AnswersJSON ? _self._AnswersJSON : AnswersJSON // ignore: cast_nullable_to_non_nullable
as List<AnswerOption>?,SubQuestions: freezed == SubQuestions ? _self._SubQuestions : SubQuestions // ignore: cast_nullable_to_non_nullable
as List<SubQuestion>?,
  ));
}


}

// dart format on
