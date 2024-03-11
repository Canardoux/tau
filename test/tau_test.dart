import 'package:flutter_test/flutter_test.dart';
import 'package:tau/tau.dart';
import 'package:tau/tau_platform_interface.dart';
import 'package:tau/tau_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTauPlatform
    with MockPlatformInterfaceMixin
    implements TauPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final TauPlatform initialPlatform = TauPlatform.instance;

  test('$MethodChannelTau is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTau>());
  });

  test('getPlatformVersion', () async {
    Tau tauPlugin = Tau();
    MockTauPlatform fakePlatform = MockTauPlatform();
    TauPlatform.instance = fakePlatform;

    expect(await tauPlugin.getPlatformVersion(), '42');
  });
}
