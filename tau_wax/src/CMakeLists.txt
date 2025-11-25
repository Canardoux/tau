# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(tau_wax_library VERSION 0.0.1 LANGUAGES C)

add_library(tau_wax SHARED
  "tau_wax.c"
)

set_target_properties(tau_wax PROPERTIES
  PUBLIC_HEADER tau_wax.h
  OUTPUT_NAME "tau_wax"
)

target_compile_definitions(tau_wax PUBLIC DART_SHARED_LIB)

if (ANDROID)
  # Support Android 15 16k page size
  target_link_options(tau_wax PRIVATE "-Wl,-z,max-page-size=16384")
endif()
