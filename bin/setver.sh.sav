#!/bin/bash
if [ -z "$1" ]; then
        echo "Correct usage is $0 <Version>"
        exit -1
fi



VERSION=$1
VERSION_CODE=${VERSION//./}
VERSION_CODE=${VERSION_CODE//+/}


        cd etau
        bin/setver.sh "$1"
        cd ..

        cd tau_web
        bin/setver.sh "$1"
        cd ..
        

        cd tau_wars
        bin/setver.sh "$1"
        cd ..
