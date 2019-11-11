class State<T> {
  State._(this.value);
  final T value;
  factory State.success(T value) = SuccessState<T>;
  factory State.error(T value) = ErrorState<T>;
}

class ErrorState<T> extends State<T> {
  ErrorState(this.value) : super._(value);
  final T value;
}

class SuccessState<T> extends State<T> {
  SuccessState(this.value) : super._(value);
  final T value;
}
