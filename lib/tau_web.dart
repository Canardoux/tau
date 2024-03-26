// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'dart:web_audio'  as dartWebAudio;
import 'tau_platform_interface.dart';


abstract class WebAudioNode extends AudioNode
{
  /* ctor */ WebAudioNode(WebAudioContext ctx, dartWebAudio.AudioNode dartWebAudioNode) :  _dartWebAudioNode = dartWebAudioNode, super(ctx, ){}
  dartWebAudio.AudioNode _dartWebAudioNode;
  @override
  void connectNode(AudioNode destination, [int output = 0, int input = 0])
  {
    _dartWebAudioNode.connectNode((destination as WebAudioNode)._dartWebAudioNode, output, input);
  }

}

class   WebMediaElementAudioSourceNode extends WebAudioNode  implements MediaElementAudioSourceNode
{
  /* ctor */ WebMediaElementAudioSourceNode(AudioContext ctx, Map options) : super(ctx as WebAudioContext, dartWebAudio.MediaElementAudioSourceNode((ctx as WebAudioContext)._dartAudioContext , options)){}

}

class WebAudioDestinationNode extends WebAudioNode implements AudioDestinationNode
{
  /* ctor */ WebAudioDestinationNode(WebAudioContext ctx) : super(ctx, ctx._dartAudioContext.destination! )
  {

  }
}
class WebAudioContext extends AudioContext
{
  dartWebAudio.AudioContext _dartAudioContext = dartWebAudio.AudioContext();
  String? get state => _dartAudioContext.state;
  Future resume() => _dartAudioContext.resume();

  /// Ctor
  WebAudioContext()
  {
  }

  @override
  MediaElementAudioSourceNode mediaElementAudioSourceNode(Map options) => WebMediaElementAudioSourceNode(this, options); // TODO
 // Factories
  // --------
  @override
 AudioDestinationNode audioDestinationNode() => WebAudioDestinationNode(this);
  @override
  GainNode? gainNode() => null; // TODO
}
/// A web implementation of the TauPlatform of the Tau plugin.
class TauWeb extends TauPlatform {
  /// Constructs a TauWeb
  TauWeb();

  static void registerWith(Registrar registrar) {
    TauPlatform.instance = TauWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    final version = html.window.navigator.userAgent;
    return version;
  }

  /* factories */

  @override
  AudioContext? audioContext() => WebAudioContext();



}
