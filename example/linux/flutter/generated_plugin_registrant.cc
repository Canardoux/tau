//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <tau/tau_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) tau_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "TauPlugin");
  tau_plugin_register_with_registrar(tau_registrar);
}
