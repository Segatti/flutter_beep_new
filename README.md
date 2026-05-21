# flutter_beep_new

Play system beeps and tones on **Android** and **iOS** without shipping audio files.

Maintained fork of [flutter_beep](https://pub.dev/packages/flutter_beep) with:

- Android plugin in **Kotlin** (Gradle Kotlin DSL, built-in Kotlin)
- iOS plugin with **CocoaPods** and **Swift Package Manager**
- Minimum Flutter **3.44**

## Installation

Add to `pubspec.yaml`:

```yaml
dependencies:
  flutter_beep_new: ^1.2.0
```

Then run:

```bash
flutter pub get
```

## Usage

```dart
import 'package:flutter_beep_new/flutter_beep_new.dart';

// Default success / failure beep (platform-specific sound IDs)
await FlutterBeep.beep();
await FlutterBeep.beep(false);

// Custom system sound by ID
await FlutterBeep.playSysSound(AndroidSoundIDs.TONE_PROP_BEEP);
await FlutterBeep.playSysSound(iOSSoundIDs.AudioToneBusy);
```

### Sound ID constants

- `AndroidSoundIDs` — Android `ToneGenerator` constants
- `iOSSoundIDs` — iOS `AudioServices` system sound IDs

See the [example](example/lib/main.dart) app for more samples.

## Platform notes

| Platform | API |
|----------|-----|
| Android | `ToneGenerator` via method channel |
| iOS | `AudioServicesPlaySystemSound` via method channel |

On Android, `playSysSound` stops any previous tone before playing a new one.

## Sponsor

[Go Noter](https://gonoter.com) — group travel and expenses assistant.

## License

BSD-3-Clause. See [LICENSE](LICENSE).
