// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() emailUnverified,
    required TResult Function() invalidEmailAndPasswordCombination,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? emailUnverified,
    TResult Function()? invalidEmailAndPasswordCombination,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? emailUnverified,
    TResult Function()? invalidEmailAndPasswordCombination,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(_EmailUnverified value) emailUnverified,
    required TResult Function(_InvalidEmailAndPasswordCombination value)
        invalidEmailAndPasswordCombination,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(_EmailUnverified value)? emailUnverified,
    TResult Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(_EmailUnverified value)? emailUnverified,
    TResult Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) then) =
      _$AuthFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthFailureCopyWithImpl<$Res> implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._value, this._then);

  final AuthFailure _value;
  // ignore: unused_field
  final $Res Function(AuthFailure) _then;
}

/// @nodoc
abstract class _$$_ServerErrorCopyWith<$Res> {
  factory _$$_ServerErrorCopyWith(
          _$_ServerError value, $Res Function(_$_ServerError) then) =
      __$$_ServerErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ServerErrorCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements _$$_ServerErrorCopyWith<$Res> {
  __$$_ServerErrorCopyWithImpl(
      _$_ServerError _value, $Res Function(_$_ServerError) _then)
      : super(_value, (v) => _then(v as _$_ServerError));

  @override
  _$_ServerError get _value => super._value as _$_ServerError;
}

/// @nodoc

class _$_ServerError implements _ServerError {
  const _$_ServerError();

  @override
  String toString() {
    return 'AuthFailure.serverError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() emailUnverified,
    required TResult Function() invalidEmailAndPasswordCombination,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? emailUnverified,
    TResult Function()? invalidEmailAndPasswordCombination,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? emailUnverified,
    TResult Function()? invalidEmailAndPasswordCombination,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(_EmailUnverified value) emailUnverified,
    required TResult Function(_InvalidEmailAndPasswordCombination value)
        invalidEmailAndPasswordCombination,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(_EmailUnverified value)? emailUnverified,
    TResult Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(_EmailUnverified value)? emailUnverified,
    TResult Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class _ServerError implements AuthFailure {
  const factory _ServerError() = _$_ServerError;
}

/// @nodoc
abstract class _$$_EmailAlreadyInUseCopyWith<$Res> {
  factory _$$_EmailAlreadyInUseCopyWith(_$_EmailAlreadyInUse value,
          $Res Function(_$_EmailAlreadyInUse) then) =
      __$$_EmailAlreadyInUseCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_EmailAlreadyInUseCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements _$$_EmailAlreadyInUseCopyWith<$Res> {
  __$$_EmailAlreadyInUseCopyWithImpl(
      _$_EmailAlreadyInUse _value, $Res Function(_$_EmailAlreadyInUse) _then)
      : super(_value, (v) => _then(v as _$_EmailAlreadyInUse));

  @override
  _$_EmailAlreadyInUse get _value => super._value as _$_EmailAlreadyInUse;
}

/// @nodoc

class _$_EmailAlreadyInUse implements _EmailAlreadyInUse {
  const _$_EmailAlreadyInUse();

  @override
  String toString() {
    return 'AuthFailure.emailAlreadyInUse()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_EmailAlreadyInUse);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() emailUnverified,
    required TResult Function() invalidEmailAndPasswordCombination,
  }) {
    return emailAlreadyInUse();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? emailUnverified,
    TResult Function()? invalidEmailAndPasswordCombination,
  }) {
    return emailAlreadyInUse?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? emailUnverified,
    TResult Function()? invalidEmailAndPasswordCombination,
    required TResult orElse(),
  }) {
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(_EmailUnverified value) emailUnverified,
    required TResult Function(_InvalidEmailAndPasswordCombination value)
        invalidEmailAndPasswordCombination,
  }) {
    return emailAlreadyInUse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(_EmailUnverified value)? emailUnverified,
    TResult Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
  }) {
    return emailAlreadyInUse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(_EmailUnverified value)? emailUnverified,
    TResult Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
    required TResult orElse(),
  }) {
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse(this);
    }
    return orElse();
  }
}

abstract class _EmailAlreadyInUse implements AuthFailure {
  const factory _EmailAlreadyInUse() = _$_EmailAlreadyInUse;
}

/// @nodoc
abstract class _$$_EmailUnverifiedCopyWith<$Res> {
  factory _$$_EmailUnverifiedCopyWith(
          _$_EmailUnverified value, $Res Function(_$_EmailUnverified) then) =
      __$$_EmailUnverifiedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_EmailUnverifiedCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements _$$_EmailUnverifiedCopyWith<$Res> {
  __$$_EmailUnverifiedCopyWithImpl(
      _$_EmailUnverified _value, $Res Function(_$_EmailUnverified) _then)
      : super(_value, (v) => _then(v as _$_EmailUnverified));

  @override
  _$_EmailUnverified get _value => super._value as _$_EmailUnverified;
}

/// @nodoc

class _$_EmailUnverified implements _EmailUnverified {
  const _$_EmailUnverified();

  @override
  String toString() {
    return 'AuthFailure.emailUnverified()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_EmailUnverified);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() emailUnverified,
    required TResult Function() invalidEmailAndPasswordCombination,
  }) {
    return emailUnverified();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? emailUnverified,
    TResult Function()? invalidEmailAndPasswordCombination,
  }) {
    return emailUnverified?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? emailUnverified,
    TResult Function()? invalidEmailAndPasswordCombination,
    required TResult orElse(),
  }) {
    if (emailUnverified != null) {
      return emailUnverified();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(_EmailUnverified value) emailUnverified,
    required TResult Function(_InvalidEmailAndPasswordCombination value)
        invalidEmailAndPasswordCombination,
  }) {
    return emailUnverified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(_EmailUnverified value)? emailUnverified,
    TResult Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
  }) {
    return emailUnverified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(_EmailUnverified value)? emailUnverified,
    TResult Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
    required TResult orElse(),
  }) {
    if (emailUnverified != null) {
      return emailUnverified(this);
    }
    return orElse();
  }
}

abstract class _EmailUnverified implements AuthFailure {
  const factory _EmailUnverified() = _$_EmailUnverified;
}

/// @nodoc
abstract class _$$_InvalidEmailAndPasswordCombinationCopyWith<$Res> {
  factory _$$_InvalidEmailAndPasswordCombinationCopyWith(
          _$_InvalidEmailAndPasswordCombination value,
          $Res Function(_$_InvalidEmailAndPasswordCombination) then) =
      __$$_InvalidEmailAndPasswordCombinationCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InvalidEmailAndPasswordCombinationCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements _$$_InvalidEmailAndPasswordCombinationCopyWith<$Res> {
  __$$_InvalidEmailAndPasswordCombinationCopyWithImpl(
      _$_InvalidEmailAndPasswordCombination _value,
      $Res Function(_$_InvalidEmailAndPasswordCombination) _then)
      : super(_value, (v) => _then(v as _$_InvalidEmailAndPasswordCombination));

  @override
  _$_InvalidEmailAndPasswordCombination get _value =>
      super._value as _$_InvalidEmailAndPasswordCombination;
}

/// @nodoc

class _$_InvalidEmailAndPasswordCombination
    implements _InvalidEmailAndPasswordCombination {
  const _$_InvalidEmailAndPasswordCombination();

  @override
  String toString() {
    return 'AuthFailure.invalidEmailAndPasswordCombination()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvalidEmailAndPasswordCombination);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() emailAlreadyInUse,
    required TResult Function() emailUnverified,
    required TResult Function() invalidEmailAndPasswordCombination,
  }) {
    return invalidEmailAndPasswordCombination();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? emailUnverified,
    TResult Function()? invalidEmailAndPasswordCombination,
  }) {
    return invalidEmailAndPasswordCombination?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? emailAlreadyInUse,
    TResult Function()? emailUnverified,
    TResult Function()? invalidEmailAndPasswordCombination,
    required TResult orElse(),
  }) {
    if (invalidEmailAndPasswordCombination != null) {
      return invalidEmailAndPasswordCombination();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_EmailAlreadyInUse value) emailAlreadyInUse,
    required TResult Function(_EmailUnverified value) emailUnverified,
    required TResult Function(_InvalidEmailAndPasswordCombination value)
        invalidEmailAndPasswordCombination,
  }) {
    return invalidEmailAndPasswordCombination(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(_EmailUnverified value)? emailUnverified,
    TResult Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
  }) {
    return invalidEmailAndPasswordCombination?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerError value)? serverError,
    TResult Function(_EmailAlreadyInUse value)? emailAlreadyInUse,
    TResult Function(_EmailUnverified value)? emailUnverified,
    TResult Function(_InvalidEmailAndPasswordCombination value)?
        invalidEmailAndPasswordCombination,
    required TResult orElse(),
  }) {
    if (invalidEmailAndPasswordCombination != null) {
      return invalidEmailAndPasswordCombination(this);
    }
    return orElse();
  }
}

abstract class _InvalidEmailAndPasswordCombination implements AuthFailure {
  const factory _InvalidEmailAndPasswordCombination() =
      _$_InvalidEmailAndPasswordCombination;
}
