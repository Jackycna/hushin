import 'package:permission_handler/permission_handler.dart';

Future<bool> checkAudio() async {
  final status = await Permission.microphone.request();
  return status.isGranted;
}
