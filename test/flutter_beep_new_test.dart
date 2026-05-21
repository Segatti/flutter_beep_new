import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_beep_new/flutter_beep_new.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('flutter_beep');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      switch (methodCall.method) {
        case 'playSysSound':
        case 'stopSysSound':
          return true;
        default:
          return null;
      }
    });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('beep invokes playSysSound', () async {
    await FlutterBeep.beep();
  });

  test('playSysSound forwards soundId', () async {
    await FlutterBeep.playSysSound(AndroidSoundIDs.TONE_PROP_BEEP);
  });
}
