#!/bin/bash


if [ "_$1" = "_REL" ] ; then

        echo "REL mode"

elif [ "_$1" = "_DEV" ]; then
        
        echo "DEV mode"

else
        echo "Correct syntax is $0 [REL | DEV]"
        exit -1
fi

        cd etau
        bin/reldev.sh "$1"
        cd ..

        cd flutter_sound
        bin/reldev.sh "$1"
        cd ..

        cd taudio
        bin/reldev.sh "$1"
        cd ..

 