import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'tau_method_channel.dart';

/*
AudioNode <- AudioDestinationNode        <- WebAudioDestinationNode
                                            [WebAudioNode]

          <- GainNode                    <- WebAudioGainNode
          <- MediaElementAudioSourceNode <- WebMediaElementAudioSourceNode
*/
abstract class AudioContext
{
  //AudioDestinationNode _audioDestinationNode = AudioDestinationNode();

  /* Factories */
  MediaElementAudioSourceNode mediaElementAudioSourceNode(Map options);
  GainNode? gainNode();
  AudioDestinationNode?  destination;
}

abstract class AudioNode
{
  AudioContext _ctx;
  /* ctor */ AudioNode(AudioContext ctx) : _ctx=ctx
  {
    //_ctx = ctx;
  }
  void connectNode(AudioNode destination, [int output = 0, int input = 0]);
}

abstract class AudioDestinationNode extends AudioNode
{
  /* ctor */ AudioDestinationNode(AudioContext ctx) : super(ctx){}
}

abstract class GainNode extends AudioNode
{
  /* ctor */ GainNode(AudioContext ctx) : super(ctx){}
}
abstract class   MediaElementAudioSourceNode extends AudioNode
{
  /* ctor */ MediaElementAudioSourceNode(AudioContext ctx) : super(ctx){}

}

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

  /* Factories */
  AudioContext? audioContext() ;
  //MediaElementAudioSourceNode mediaElementAudioSourceNode();
}
