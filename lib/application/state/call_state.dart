abstract class CallState {}

class CallInitial extends CallState {}

class CallLoading extends CallState {}

class CallStarted extends CallState {}

class CallEndded extends CallState {}

class CallError extends CallState {
  final String message;
  CallError(this.message);
}
