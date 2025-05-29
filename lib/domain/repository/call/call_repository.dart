import 'package:hushin/domain/entities/call/call_entities.dart';

abstract class CallRepository {
  Future<void> startcall(CallEntities call);
  Future<void> endcall();
}
