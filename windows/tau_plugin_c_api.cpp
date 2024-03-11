#include "include/tau/tau_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "tau_plugin.h"

void TauPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  tau::TauPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
