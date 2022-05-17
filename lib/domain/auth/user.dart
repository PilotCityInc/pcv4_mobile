import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pcv4_mobile/domain/auth/value_objects.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required EmailAddress email,
  }) = _User;
}
