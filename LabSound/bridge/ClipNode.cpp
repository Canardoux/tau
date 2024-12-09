#include "./dart_api/dart_api.h"
#include "LabSound/LabSound.h"
#include "KeepNode.cpp"
using namespace lab;

DART_EXPORT int createClipNode(AudioContext* context) {
    auto node = std::make_shared<ClipNode>(*context);
    return keepNode(node);
}

DART_EXPORT void ClipNode_setMode(int nodeId, int type) {
    auto node = std::static_pointer_cast<ClipNode>(getNode(nodeId));
    if(node) node->setMode(ClipNode::Mode(type));
}

DART_EXPORT int ClipNode_aVal(int nodeId) {
    auto node = std::static_pointer_cast<ClipNode>(getNode(nodeId));
    return node ? keepAudioParam(nodeId, 1, node->aVal()) : -1;
}

DART_EXPORT int ClipNode_bVal(int nodeId) {
    auto node = std::static_pointer_cast<ClipNode>(getNode(nodeId));
    return node ? keepAudioParam(nodeId, 2, node->bVal()) : -1;
}