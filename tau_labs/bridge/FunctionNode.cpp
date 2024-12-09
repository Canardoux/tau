#include "./dart_api/dart_api.h"
#include "LabSound/LabSound.h"
#include "KeepNode.cpp"
#include "Port.cpp"

using namespace lab;

std::function<void(int nodeId, int channel, float * values, int bufferSize)> _functionNodeChannelFn;

DART_EXPORT void setFunctionNodeChannelFn(void (*fn)(int nodeId, int channel, float * values, int bufferSize)) {
    _functionNodeChannelFn = fn;
    // debug
    _functionNodeChannelFn(0, 0, nullptr, 0);
}

DART_EXPORT int createFunctionNode(AudioContext* context, int channels) {
    auto node = std::make_shared<FunctionNode>(*context, channels);
    return keepNode(node);
}

DART_EXPORT double FunctionNode_now(int nodeId) {
    auto node = std::static_pointer_cast<FunctionNode>(getNode(nodeId));
    return node ? node->now() : 0.0;
}

DART_EXPORT void FunctionNode_setFunction(int nodeId) {
    auto node = std::static_pointer_cast<FunctionNode>(getNode(nodeId));
    if(node) {
        node->setFunction([nodeId](ContextRenderLock & r, FunctionNode * me, int channel, float * values, size_t framesToProcess) {
            // sendFunctionNodeSendPort(nodeId, channel, values, framesToProcess);
            _functionNodeChannelFn(nodeId, channel, values, framesToProcess);
        });
    }
}
