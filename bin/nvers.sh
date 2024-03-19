#!/bin/bash


source TAU_VERSION
major="${TAU_VERSION%.*}" 
minor="${TAU_VERSION#*.}"  # remove everything until the first '.'
pat="${minor#*.}" # remove everything until the second '.'
let "++TAU_VERSION_INT"
let "++pat"
TAU_VERSION=$major.$pat
echo TAU_VERSION=$TAU_VERSION
echo TAU_VERSION=$TAU_VERSION > TAU_VERSION
echo TAU_VERSION_INT=$TAU_VERSION_INT >> TAU_VERSION

TAU_VERSION
bin/setvers.sh $TAU_VERSION

echo "******************* v$TAU_VERSION *******************"