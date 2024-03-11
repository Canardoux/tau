import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'tau_method_channel.dart';

abstract class TauPlatform extends PlatformInterface {
  /// Constructs a TauPlatform.
  TauPlatform() : super(token: _token);

  static final Object _token = Object();

  static TauPlatform _instance = MethodChannelTau();

  /// The default instance of [TauPlatform] to use.
  ///
  /// Defaults to [MethodChannelTau].
  static TauPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TauPlatform] when
  /// they register themselves.
  static set instance(TauPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
