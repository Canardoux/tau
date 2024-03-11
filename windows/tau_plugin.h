#ifndef FLUTTER_PLUGIN_TAU_PLUGIN_H_
#define FLUTTER_PLUGIN_TAU_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace tau {

class TauPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  TauPlugin();

  virtual ~TauPlugin();

  // Disallow copy and assign.
  TauPlugin(const TauPlugin&) = delete;
  TauPlugin& operator=(const TauPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace tau

#endif  // FLUTTER_PLUGIN_TAU_PLUGIN_H_
