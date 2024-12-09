#include "./dart_api/dart_api.h"
#include "LabSound/LabSound.h"
#include "KeepNode.cpp"
using namespace lab;

DART_EXPORT int createPWMNode(AudioContext* context) {
    auto node = std::make_shared<PWMNode>(*context);
    return keepNode(node);
}