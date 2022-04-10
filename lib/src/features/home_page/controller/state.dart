import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class State<T> with _$State<T> {
  //init
  const factory State.initial() = _StateInitial<T>;
  const factory State.loading() = _StateLoading<T>;

  const factory State.loaded(T data) = _StateLoaded<T>;
  const factory State.error([String? errorMessage]) = _StateError<T>;
}
