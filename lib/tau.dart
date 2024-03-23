import 'tau_platform_interface.dart';


class Tau {

  AudioContext? audioContext() => TauPlatform.instance.audioContext();

  Future<String?> getPlatformVersion() {
    return TauPlatform.instance.getPlatformVersion();
  }

 }
