#!/bin/bash


# Podfile sometimes disapeers !???!
#if [ ! -f flutter_sound/example/ios/Podfile ]; then
#    echo "Podfile not found."
#    cp flutter_sound/example/ios/Podfile.keep flutter_sound/example/ios/Podfile
#fi

if [ "_$1" = "_REL" ] ; then
        echo 'REL mode'
        echo '--------'

# flutter_sound/example/pubspec.yaml
#-----------------------------------
        gsed -i  "s/^ *tau: *#* *\(.*\)$/  tau: \1/"                                                                               example/pubspec.yaml
        gsed -i  "s/^ *path: \.\.\/ # Tau Dir$/#    path: \.\.\/ # Tau Dir/"                                                       example/pubspec.yaml

        exit 0

#========================================================================================================================================================================================================


elif [ "_$1" = "_DEV" ]; then
        echo 'DEV mode'
        echo '--------'

# flutter_sound/example/pubspec.yaml
#-----------------------------------
gsed -i  "s/^ *tau: *#* *\(.*\)$/  tau: # \1/"                                                                                    example/pubspec.yaml
gsed -i  "s/^# *path: \.\.\/ # Tau Dir$/    path: \.\.\/ # Tau Dir/"                                                              example/pubspec.yaml

        exit 0

else
        echo "Correct syntax is $0 [REL | DEV]"
        exit -1
fi
echo "Done"
