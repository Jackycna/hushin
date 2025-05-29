import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hushin/application/state/call_state.dart';
import 'package:hushin/domain/entities/call/call_entities.dart';
import 'package:hushin/domain/usecases/call/initial_call_usecase.dart';

class CallBloc extends Cubit<CallState> {
  final InitialCallUsecase initialusecase;
  CallBloc(this.initialusecase) : super(CallInitial());
  Future<void> startcall(CallEntities call) async {
    try {
      emit(CallLoading());
      await initialusecase.execute(call);
      emit(CallStarted());
    } catch (_) {
      emit(CallError("Failed to start"));
    }
  }

  Future<void> endcall() async {
    emit(CallEndded());
  }
}
