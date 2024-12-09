#!/bin/bash
mkdir build
cmake -B ./build -G "Xcode" -DPLATFORM=OS64 -DCMAKE_TOOLCHAIN_FILE=../cmake/ios-toolchain.cmake -DCMAKE_BUILD_TYPE=Release
cmake --build ./build --config Release

mkdir build-simulator
cmake -B ./build-simulator -G "Xcode" -DPLATFORM=SIMULATOR64 -DCMAKE_TOOLCHAIN_FILE=../cmake/ios-toolchain.cmake -DCMAKE_BUILD_TYPE=Release
cmake --build ./build-simulator --config Release

mkdir -p ./products
cp -r ./build/Release-iphoneos/LabSoundBridge.framework ./products
lipo -create -output ./products/LabSoundBridge.framework/LabSoundBridge ./build/Release-iphoneos/LabSoundBridge.framework/LabSoundBridge ./build-simulator/Release-iphonesimulator/LabSoundBridge.framework/LabSoundBridge

echo $MACOS_CERTIFICATE | base64 --decode > certificate.p12
security create-keychain -p abc123 build.keychain
security default-keychain -s build.keychain
security unlock-keychain -p abc123 build.keychain
security import certificate.p12 -k build.keychain -P $MACOS_CERTIFICATE_PWD -T /usr/bin/codesign
security set-key-partition-list -S apple-tool:,apple:,codesign: -s -k abc123 build.keychain
codesignIdentity=`security find-identity -p codesigning -v | grep -Eo "[0-9A-F]{40}" | head -n 1`
/usr/bin/codesign --force -s $codesignIdentity ./products/LabSoundBridge.framework -v

tar -zcvf LabSoundBridge_ios.tar.gz -C ./products LabSoundBridge.framework
