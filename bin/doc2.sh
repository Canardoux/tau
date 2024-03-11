#!/bin/bash

export PATH=~/android-studio/bin:$PATH
export PATH=$PATH:~/flutter/bin
export ANDROID_HOME=~/Android/Sdk
export ANDROID_NDK_HOME=$ANDROID_HOME/ndk/android-ndk-r21e # 23.1.7779620
export PATH=~/bin:$PATH
export PATH=~/gradle-7.4/bin:$PATH
export PATH="$PATH:/opt/flutter/bin"
export FLUTTER_ROOT=/opt/flutter

export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

rm -rf /tmp/toto_doc 2>/dev/null
mkdir -v /tmp/toto_doc 2>/tmp/null
tar xzf _toto.tgz -C /tmp/toto_doc 2>/dev/null
tar xzf _toto3.tgz  -C /tmp/toto_doc 2>/dev/null
rm -rf /tmp/toto_doc/_site /tmp/toto_doc/example/ios

exit 0


rm -rf /tmp/toto_doc/flutter_sound/example/ios/Pods 

rm -rf /var/www/canardoux.xyz/flutter-sound/*
cp -a /tmp/toto_doc/_site/* /var/www/canardoux.xyz/flutter-sound/

cd /var/www/canardoux.xyz/flutter-sound



cd /var/www/canardoux.xyz/flutter-sound
#cd api/topics
#rm favico*
#ln -s ../../images/favico* .
#cd
cd
######rm _toto.tgz _toto3.tgz


echo "Live web example"
cd /tmp/toto_doc/flutter_sound/example

flutter build web
if [ $? -ne 0 ]; then
    echo "Error"
    exit -1
fi
cd 

rm -rf /var/www/canardoux.xyz/flutter-sound/web_example/
cp -a /tmp/toto_doc/flutter_sound/example/assets/samples/ /tmp/toto_doc/flutter_sound/example/assets/extract /tmp/toto_doc/flutter_sound/example/build/web/assets
cp -a /tmp/toto_doc/flutter_sound/example/build/web /var/www/canardoux.xyz/flutter-sound/web_example
