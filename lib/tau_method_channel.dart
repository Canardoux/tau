import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'tau_platform_interface.dart';

/// An implementation of [TauPlatform] that uses method channels.
class MethodChannelTau extends TauPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('tau');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
  
  @override
  AudioContext? audioContext() => null; // TODO
  
  @override
  MediaElementAudioSourceNode? mediaElementAudioSourceNode() => null; // TODO


}
