import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:hushin/domain/entities/call/call_entities.dart';
import 'package:hushin/domain/repository/call/call_repository.dart';

class CallRepositoryImple implements CallRepository {
  final RtcEngine engine;
  CallRepositoryImple(this.engine);
  @override
  Future<void> endcall() async {
    await engine.leaveChannel();
    await engine.release();
  }

  @override
  Future<void> startcall(CallEntities call) async {
    await engine.initialize(RtcEngineContext(appId: call.appId));

    await engine.enableAudio();
    await engine.joinChannel(
      token: call.token,
      channelId: call.channelName,
      uid: 0,
      options: ChannelMediaOptions(),
    );
  }
}
