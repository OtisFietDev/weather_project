import 'package:freezed_annotation/freezed_annotation.dart';

part 'problem.freezed.dart';
part 'problem.g.dart';

@freezed
class Problem with _$Problem {
  const factory Problem({
    required String title,
    required int status,
    required String detail,
    int? code,
  }) = _Problem;

  factory Problem.fromJson(Map<String, dynamic> json) => _$ProblemFromJson(json);
}
