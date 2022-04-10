// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StateTearOff {
  const _$StateTearOff();

  _StateInitial<T> initial<T>() {
    return _StateInitial<T>();
  }

  _StateLoading<T> loading<T>() {
    return _StateLoading<T>();
  }

  _StateLoaded<T> loaded<T>(T data) {
    return _StateLoaded<T>(
      data,
    );
  }

  _StateError<T> error<T>([String? errorMessage]) {
    return _StateError<T>(
      errorMessage,
    );
  }
}

/// @nodoc
const $State = _$StateTearOff();

/// @nodoc
mixin _$State<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(String? errorMessage) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String? errorMessage)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String? errorMessage)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StateInitial<T> value) initial,
    required TResult Function(_StateLoading<T> value) loading,
    required TResult Function(_StateLoaded<T> value) loaded,
    required TResult Function(_StateError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_StateInitial<T> value)? initial,
    TResult Function(_StateLoading<T> value)? loading,
    TResult Function(_StateLoaded<T> value)? loaded,
    TResult Function(_StateError<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StateInitial<T> value)? initial,
    TResult Function(_StateLoading<T> value)? loading,
    TResult Function(_StateLoaded<T> value)? loaded,
    TResult Function(_StateError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateCopyWith<T, $Res> {
  factory $StateCopyWith(State<T> value, $Res Function(State<T>) then) =
      _$StateCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$StateCopyWithImpl<T, $Res> implements $StateCopyWith<T, $Res> {
  _$StateCopyWithImpl(this._value, this._then);

  final State<T> _value;
  // ignore: unused_field
  final $Res Function(State<T>) _then;
}

/// @nodoc
abstract class _$StateInitialCopyWith<T, $Res> {
  factory _$StateInitialCopyWith(
          _StateInitial<T> value, $Res Function(_StateInitial<T>) then) =
      __$StateInitialCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$StateInitialCopyWithImpl<T, $Res> extends _$StateCopyWithImpl<T, $Res>
    implements _$StateInitialCopyWith<T, $Res> {
  __$StateInitialCopyWithImpl(
      _StateInitial<T> _value, $Res Function(_StateInitial<T>) _then)
      : super(_value, (v) => _then(v as _StateInitial<T>));

  @override
  _StateInitial<T> get _value => super._value as _StateInitial<T>;
}

/// @nodoc

class _$_StateInitial<T> implements _StateInitial<T> {
  const _$_StateInitial();

  @override
  String toString() {
    return 'State<$T>.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _StateInitial<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(String? errorMessage) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String? errorMessage)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String? errorMessage)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StateInitial<T> value) initial,
    required TResult Function(_StateLoading<T> value) loading,
    required TResult Function(_StateLoaded<T> value) loaded,
    required TResult Function(_StateError<T> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_StateInitial<T> value)? initial,
    TResult Function(_StateLoading<T> value)? loading,
    TResult Function(_StateLoaded<T> value)? loaded,
    TResult Function(_StateError<T> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StateInitial<T> value)? initial,
    TResult Function(_StateLoading<T> value)? loading,
    TResult Function(_StateLoaded<T> value)? loaded,
    TResult Function(_StateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _StateInitial<T> implements State<T> {
  const factory _StateInitial() = _$_StateInitial<T>;
}

/// @nodoc
abstract class _$StateLoadingCopyWith<T, $Res> {
  factory _$StateLoadingCopyWith(
          _StateLoading<T> value, $Res Function(_StateLoading<T>) then) =
      __$StateLoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$StateLoadingCopyWithImpl<T, $Res> extends _$StateCopyWithImpl<T, $Res>
    implements _$StateLoadingCopyWith<T, $Res> {
  __$StateLoadingCopyWithImpl(
      _StateLoading<T> _value, $Res Function(_StateLoading<T>) _then)
      : super(_value, (v) => _then(v as _StateLoading<T>));

  @override
  _StateLoading<T> get _value => super._value as _StateLoading<T>;
}

/// @nodoc

class _$_StateLoading<T> implements _StateLoading<T> {
  const _$_StateLoading();

  @override
  String toString() {
    return 'State<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _StateLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(String? errorMessage) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String? errorMessage)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String? errorMessage)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StateInitial<T> value) initial,
    required TResult Function(_StateLoading<T> value) loading,
    required TResult Function(_StateLoaded<T> value) loaded,
    required TResult Function(_StateError<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_StateInitial<T> value)? initial,
    TResult Function(_StateLoading<T> value)? loading,
    TResult Function(_StateLoaded<T> value)? loaded,
    TResult Function(_StateError<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StateInitial<T> value)? initial,
    TResult Function(_StateLoading<T> value)? loading,
    TResult Function(_StateLoaded<T> value)? loaded,
    TResult Function(_StateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _StateLoading<T> implements State<T> {
  const factory _StateLoading() = _$_StateLoading<T>;
}

/// @nodoc
abstract class _$StateLoadedCopyWith<T, $Res> {
  factory _$StateLoadedCopyWith(
          _StateLoaded<T> value, $Res Function(_StateLoaded<T>) then) =
      __$StateLoadedCopyWithImpl<T, $Res>;
  $Res call({T data});
}

/// @nodoc
class __$StateLoadedCopyWithImpl<T, $Res> extends _$StateCopyWithImpl<T, $Res>
    implements _$StateLoadedCopyWith<T, $Res> {
  __$StateLoadedCopyWithImpl(
      _StateLoaded<T> _value, $Res Function(_StateLoaded<T>) _then)
      : super(_value, (v) => _then(v as _StateLoaded<T>));

  @override
  _StateLoaded<T> get _value => super._value as _StateLoaded<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_StateLoaded<T>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_StateLoaded<T> implements _StateLoaded<T> {
  const _$_StateLoaded(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'State<$T>.loaded(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StateLoaded<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$StateLoadedCopyWith<T, _StateLoaded<T>> get copyWith =>
      __$StateLoadedCopyWithImpl<T, _StateLoaded<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(String? errorMessage) error,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String? errorMessage)? error,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String? errorMessage)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StateInitial<T> value) initial,
    required TResult Function(_StateLoading<T> value) loading,
    required TResult Function(_StateLoaded<T> value) loaded,
    required TResult Function(_StateError<T> value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_StateInitial<T> value)? initial,
    TResult Function(_StateLoading<T> value)? loading,
    TResult Function(_StateLoaded<T> value)? loaded,
    TResult Function(_StateError<T> value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StateInitial<T> value)? initial,
    TResult Function(_StateLoading<T> value)? loading,
    TResult Function(_StateLoaded<T> value)? loaded,
    TResult Function(_StateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _StateLoaded<T> implements State<T> {
  const factory _StateLoaded(T data) = _$_StateLoaded<T>;

  T get data;
  @JsonKey(ignore: true)
  _$StateLoadedCopyWith<T, _StateLoaded<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$StateErrorCopyWith<T, $Res> {
  factory _$StateErrorCopyWith(
          _StateError<T> value, $Res Function(_StateError<T>) then) =
      __$StateErrorCopyWithImpl<T, $Res>;
  $Res call({String? errorMessage});
}

/// @nodoc
class __$StateErrorCopyWithImpl<T, $Res> extends _$StateCopyWithImpl<T, $Res>
    implements _$StateErrorCopyWith<T, $Res> {
  __$StateErrorCopyWithImpl(
      _StateError<T> _value, $Res Function(_StateError<T>) _then)
      : super(_value, (v) => _then(v as _StateError<T>));

  @override
  _StateError<T> get _value => super._value as _StateError<T>;

  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(_StateError<T>(
      errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_StateError<T> implements _StateError<T> {
  const _$_StateError([this.errorMessage]);

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'State<$T>.error(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StateError<T> &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  _$StateErrorCopyWith<T, _StateError<T>> get copyWith =>
      __$StateErrorCopyWithImpl<T, _StateError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(String? errorMessage) error,
  }) {
    return error(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String? errorMessage)? error,
  }) {
    return error?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(String? errorMessage)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StateInitial<T> value) initial,
    required TResult Function(_StateLoading<T> value) loading,
    required TResult Function(_StateLoaded<T> value) loaded,
    required TResult Function(_StateError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_StateInitial<T> value)? initial,
    TResult Function(_StateLoading<T> value)? loading,
    TResult Function(_StateLoaded<T> value)? loaded,
    TResult Function(_StateError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StateInitial<T> value)? initial,
    TResult Function(_StateLoading<T> value)? loading,
    TResult Function(_StateLoaded<T> value)? loaded,
    TResult Function(_StateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _StateError<T> implements State<T> {
  const factory _StateError([String? errorMessage]) = _$_StateError<T>;

  String? get errorMessage;
  @JsonKey(ignore: true)
  _$StateErrorCopyWith<T, _StateError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
