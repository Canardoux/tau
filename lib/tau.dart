import 'tau_platform_interface.dart';

class Tau {
  Future<String?> getPlatformVersion() {
    return TauPlatform.instance.getPlatformVersion();
  }
}
