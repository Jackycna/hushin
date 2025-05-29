import 'package:hushin/domain/entities/call/call_entities.dart';
import 'package:hushin/domain/repository/call/call_repository.dart';

class InitialCallUsecase {
  final CallRepository repository;
  InitialCallUsecase(this.repository);
  Future<void> execute(CallEntities call) {
    return repository.startcall(call);
  }
}
