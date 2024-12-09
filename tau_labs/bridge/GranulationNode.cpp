#include "./dart_api/dart_api.h"
#include "LabSound/LabSound.h"
#include "KeepNode.cpp"
#include "AudioBus.cpp"
using namespace lab;

DART_EXPORT int createGranulationNode(AudioContext* context) {
    auto node = std::make_shared<GranulationNode>(*context);
    return keepNode(node);
}

DART_EXPORT void GranulationNode_setGrainSource(int nodeId, AudioContext* context, int busId) {
    ContextRenderLock r(context,"setGrainSource");
    auto node = std::static_pointer_cast<GranulationNode>(getNode(nodeId));
    auto bus = getBus(busId);
    if(node && bus) node->setGrainSource(r, bus);
}

DART_EXPORT int GranulationNode_getGrainSource(int nodeId) {
    auto node = std::static_pointer_cast<GranulationNode>(getNode(nodeId));
    return node ? keepBus(std::move(node->getGrainSource())) : -1;
}

DART_EXPORT int GranulationNode_grainSourceBus(int nodeId) {
    auto node = std::static_pointer_cast<GranulationNode>(getNode(nodeId));
    return node ? keepAudioSetting(nodeId, 0 , node->grainSourceBus) : -1;
}
DART_EXPORT int GranulationNode_windowFunc(int nodeId) {
    auto node = std::static_pointer_cast<GranulationNode>(getNode(nodeId));
    return node ? keepAudioSetting(nodeId, 1 , node->windowFunc) : -1;
}

DART_EXPORT int GranulationNode_numGrains(int nodeId) {
    auto node = std::static_pointer_cast<GranulationNode>(getNode(nodeId));
    return node ? keepAudioParam(nodeId, 2 , node->numGrains) : -1;
}

DART_EXPORT int GranulationNode_grainDuration(int nodeId) {
    auto node = std::static_pointer_cast<GranulationNode>(getNode(nodeId));
    return node ? keepAudioParam(nodeId, 3 , node->grainDuration) : -1;
}

DART_EXPORT int GranulationNode_grainPositionMin(int nodeId) {
    auto node = std::static_pointer_cast<GranulationNode>(getNode(nodeId));
    return node ? keepAudioParam(nodeId, 4 , node->grainPositionMin) : -1;
}

DART_EXPORT int GranulationNode_grainPositionMax(int nodeId) {
    auto node = std::static_pointer_cast<GranulationNode>(getNode(nodeId));
    return node ? keepAudioParam(nodeId, 5 , node->grainPositionMax) : -1;
}

DART_EXPORT int GranulationNode_grainPlaybackFreq(int nodeId) {
    auto node = std::static_pointer_cast<GranulationNode>(getNode(nodeId));
    return node ? keepAudioParam(nodeId, 6 , node->grainPlaybackFreq) : -1;
}