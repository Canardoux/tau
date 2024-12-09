#ifndef KEEP_NODE_CPP
#define KEEP_NODE_CPP

#include "LabSound/LabSound.h"
using namespace lab;


const char* returnString(std::string someString)
{
    char* ptr = new char[someString.size() + 1]; // +1 for terminating NUL
    strcpy(ptr, someString.c_str());
    return ptr;
}


std::map<int, std::map<int, std::shared_ptr<AudioParam>>> audioParams;

std::shared_ptr<AudioParam> getKeepAudioParam(int nodeId, int key) {
    std::map<int, std::map<int, std::shared_ptr<AudioParam>>>::iterator ite = audioParams.find(nodeId);
    if (ite != audioParams.end()) {
       std::map<int, std::shared_ptr<AudioParam>>::iterator ite2 = ite->second.find(key);
       if(ite2 != ite->second.end()) {
           return ite2->second;
       }
    }
    return nullptr;
}

int keepAudioParam(int nodeId, int key, std::shared_ptr<AudioParam> audioParam){
    std::map<int, std::map<int, std::shared_ptr<AudioParam>>>::iterator ite = audioParams.find(nodeId);
    if (ite != audioParams.end()) {
        ite->second.insert(std::pair<int,std::shared_ptr<AudioParam>>(key, audioParam));
    }else {
        std::map<int, std::shared_ptr<AudioParam>> temp;
        temp.insert(std::pair<int,std::shared_ptr<AudioParam>>(key, audioParam));
        audioParams.insert(std::pair<int, std::map<int, std::shared_ptr<AudioParam>>>(nodeId, temp));
    }
    return key;
}

int nodeCount;
std::map<int,std::shared_ptr<AudioNode>> audioNodes;
std::map<std::shared_ptr<AudioNode>,int> audioNodeIdMap;

int keepNode(std::shared_ptr<AudioNode> node){
    std::map<std::shared_ptr<AudioNode>,int>::iterator ite = audioNodeIdMap.find(node);
    if (ite != audioNodeIdMap.end()) {
        return ite->second;
    }
    nodeCount++;
    audioNodes.insert(std::pair<int,std::shared_ptr<AudioNode>>(nodeCount,node));
    audioNodeIdMap.insert(std::pair<std::shared_ptr<AudioNode>,int>(node,nodeCount));
    return nodeCount;
}

std::shared_ptr<AudioNode> getNode(int nodeId) {
    if(nodeId < 0) return nullptr;
    std::map<int,std::shared_ptr<AudioNode>>::iterator ite = audioNodes.find(nodeId);
    if (ite != audioNodes.end()) {
        return ite->second;
    }
    return nullptr;
}





std::map<int, std::map<int, std::shared_ptr<AudioSetting>>> audioSettingMap;

std::shared_ptr<AudioSetting> getKeepAudioSetting(int nodeId, int key) {
    std::map<int, std::map<int, std::shared_ptr<AudioSetting>>>::iterator ite = audioSettingMap.find(nodeId);
    if (ite != audioSettingMap.end()) {
       std::map<int, std::shared_ptr<AudioSetting>>::iterator ite2 = ite->second.find(key);
       if(ite2 != ite->second.end()) {
           return ite2->second;
       }
    }
    return nullptr;
}

int keepAudioSetting(int nodeId, int key, std::shared_ptr<AudioSetting> audioSetting){
    std::map<int, std::map<int, std::shared_ptr<AudioSetting>>>::iterator ite = audioSettingMap.find(nodeId);
    if (ite != audioSettingMap.end()) {
        ite->second.insert(std::pair<int,std::shared_ptr<AudioSetting>>(key, audioSetting));
    }else {
        std::map<int, std::shared_ptr<AudioSetting>> temp;
        temp.insert(std::pair<int,std::shared_ptr<AudioSetting>>(key, audioSetting));
        audioSettingMap.insert(std::pair<int, std::map<int, std::shared_ptr<AudioSetting>>>(nodeId, temp));
    }
    return key;
}

void keepNodeRelease(int nodeId) {
    std::map<int,std::shared_ptr<AudioNode>>::iterator ite = audioNodes.find(nodeId);
    if (ite != audioNodes.end()) {
        audioNodeIdMap.erase(ite->second);
    }
    audioNodes.erase(nodeId);
    audioParams.erase(nodeId);
    audioSettingMap.erase(nodeId);
}

std::map<int,std::shared_ptr<AudioListener>> audioListenerMap;
std::map<std::shared_ptr<AudioListener>,int> audioListenerMapReverse;

int keepAudioListener(std::shared_ptr<AudioListener> listener){
    std::map<std::shared_ptr<AudioListener>,int>::iterator ite = audioListenerMapReverse.find(listener);
    if (ite != audioListenerMapReverse.end()) {
        return ite->second;
    }
    nodeCount++;
    audioListenerMap.insert(std::pair<int,std::shared_ptr<AudioListener>>(nodeCount, listener));
    audioListenerMapReverse.insert(std::pair<std::shared_ptr<AudioListener>,int>(listener, nodeCount));
    return nodeCount;
}

std::shared_ptr<AudioListener> getAudioListener(int audioListenerId) {
    if(audioListenerId < 0) return nullptr;
    std::map<int,std::shared_ptr<AudioListener>>::iterator ite = audioListenerMap.find(audioListenerId);
    if (ite != audioListenerMap.end()) {
        return ite->second;
    }
    return nullptr;
}


void keepAudioListenerRelease(int audioListenerId) {
    std::map<int,std::shared_ptr<AudioListener>>::iterator ite = audioListenerMap.find(audioListenerId);
    if (ite != audioListenerMap.end()) {
        audioListenerMapReverse.erase(ite->second);
    }
    audioParams.erase(audioListenerId);
    audioSettingMap.erase(audioListenerId);
}


#endif