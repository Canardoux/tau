#ifndef DART_PORT_CPP
#define DART_PORT_CPP

#include "./dart_api/dart_api.h"
#include "./dart_api/dart_native_api.h"
#include "./dart_api/dart_api_dl.h"

// Initialize `dart_api_dl.h`
DART_EXPORT intptr_t InitDartApiDL(void* data) {
  return Dart_InitializeApiDL(data);
}

Dart_Port decodeAudioSendPort;
Dart_Port audioSampleOnEndSendPort;
Dart_Port offlineRenderCompleteSendPort;
Dart_Port functionNodeSendPort;

DART_EXPORT void registerDecodeAudioSendPort(Dart_Port sendPort) {
    decodeAudioSendPort = sendPort;
}
DART_EXPORT void registerAudioSampleOnEndedSendPort(Dart_Port sendPort) {
    audioSampleOnEndSendPort = sendPort;
}
DART_EXPORT void registerOfflineRenderCompleteSendPort(Dart_Port sendPort) {
    offlineRenderCompleteSendPort = sendPort;
}
DART_EXPORT void registerFunctionNodeSendPort(Dart_Port sendPort) {
    functionNodeSendPort = sendPort;
}


void sendAudioAusStatus(int busId, int status) {
    if(!decodeAudioSendPort) return;

    Dart_CObject dart_busId;
    dart_busId.type = Dart_CObject_kInt32;
    dart_busId.value.as_int32 = busId;

    Dart_CObject dart_status;
    dart_status.type = Dart_CObject_kInt32;
    dart_status.value.as_int32 = status;

    Dart_CObject* c_request_arr[] = {&dart_busId, &dart_status};

    Dart_CObject dart_object;
    dart_object.type = Dart_CObject_kArray;
    dart_object.value.as_array.values = c_request_arr;
    dart_object.value.as_array.length = 2;
    Dart_PostCObject_DL(decodeAudioSendPort, &dart_object);
}

void sendAudioSampleOnEnded(int nodeId) {
  if(!audioSampleOnEndSendPort) return;

  Dart_CObject dart_nodeId;
  dart_nodeId.type = Dart_CObject_kInt32;
  dart_nodeId.value.as_int32 = nodeId;

  Dart_CObject* c_request_arr[] = {&dart_nodeId};

  Dart_CObject dart_object;
  dart_object.type = Dart_CObject_kArray;
  dart_object.value.as_array.values = c_request_arr;
  dart_object.value.as_array.length = 1;
  Dart_PostCObject_DL(audioSampleOnEndSendPort, &dart_object);
}

void sendOfflineRenderComplete(int id, int status) {
   if(!offlineRenderCompleteSendPort) return;
    Dart_CObject dart_id;
    dart_id.type = Dart_CObject_kInt32;
    dart_id.value.as_int32 = id;
    Dart_CObject dart_status;
    dart_status.type = Dart_CObject_kInt32;
    dart_status.value.as_int32 = status;
    Dart_CObject* c_request_arr[] = {&dart_id, &dart_status};
    Dart_CObject dart_object;
    dart_object.type = Dart_CObject_kArray;
    dart_object.value.as_array.values = c_request_arr;
    dart_object.value.as_array.length = 2;
    Dart_PostCObject_DL(offlineRenderCompleteSendPort, &dart_object);
}

void sendFunctionNodeSendPort(int nodeId, int channel, float * values, int bufferSize) {
   if(!functionNodeSendPort) return;

    Dart_CObject _nodeId;
    _nodeId.type = Dart_CObject_kInt32;
    _nodeId.value.as_int64 = nodeId;

    Dart_CObject _channel;
    _channel.type = Dart_CObject_kInt32;
    _channel.value.as_int64 = channel;

    Dart_CObject _bufferSize;
    _bufferSize.type = Dart_CObject_kInt32;
    _bufferSize.value.as_int64 = bufferSize;
    
    Dart_CObject _values;
    _values.type = Dart_CObject_kInt64;
    _values.value.as_int64 = reinterpret_cast<intptr_t>(values);

    Dart_CObject* c_request_arr[] = {&_nodeId, &_channel, &_values, &_bufferSize};
    Dart_CObject dart_object;
    dart_object.type = Dart_CObject_kArray;
    dart_object.value.as_array.values = c_request_arr;
    dart_object.value.as_array.length = 4;
    Dart_PostCObject_DL(functionNodeSendPort, &dart_object);
}

#endif