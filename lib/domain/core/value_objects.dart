import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:pcv4_mobile/domain/core/errors.dart';
import 'package:pcv4_mobile/domain/core/value_failures.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  T getOrCrash() {
    // id = identity - same as writing (value) => value
    return value.fold((failure) => throw UnexpectedValueError(failure), id);
  }

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    /// Get the value failure cast to a dynamic type to
    /// combine multiple types of values.
    return value.fold(
      (valueFailure) => left(valueFailure),
      (_) => right(unit),
    );
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}
