#include "./dart_api/dart_api.h"
#include "LabSound/LabSound.h"
#include "KeepNode.cpp"
#include "struct.h"
using namespace lab;

DART_EXPORT int createChannelSplitterNode(AudioContext* context, int numberOfOutputs) {
    auto node = std::make_shared<ChannelSplitterNode>(*context, numberOfOutputs);
    return keepNode(node);
}

DART_EXPORT void ChannelSplitterNode_addOutputs(int nodeId, int n) {
    auto node = std::static_pointer_cast<ChannelSplitterNode>(getNode(nodeId));
    if(node) node->addOutputs(n);
}
