#!/bin/bash
if [ -z "$1" ]; then
        echo "Correct usage is $0 <Version>"
        exit -1
fi



VERSION=$1
VERSION_CODE=${VERSION//./}
VERSION_CODE=${VERSION_CODE//+/}

echo "Setting the tau version $VERSION"


# Documentation
# -------------
gsed -i  "s/^TAU_VERSION:.*/TAU_VERSION: $VERSION/"                                     doc/_config.yml
gsed -i  "s/^\( *version: \).*/\1$VERSION/"                                             doc/_data/sidebars/mydoc_sidebar.yml
gsed -i  "s/^\( *## \).*$/\1$VERSION/"                                                  CHANGELOG.md

# Flutter - Tau
# -------------
gsed -i  "s/^\( *version: *\).*$/\1$VERSION/"                                           pubspec.yaml

# Flutter Example
# ---------------
gsed -i  "s/^\( *version: *\).*$/\1$VERSION/"                                           example/pubspec.yaml
gsed -i  "s/^\( *tau: *#* *\^*\).*$/\1$VERSION/"                                        example/pubspec.yaml

# iOS
# ---
gsed -i  "s/^\( *s.version *= *\).*$/\1'$VERSION'/"                                     ios/tau.podspec 2>/dev/null

# Android
# -------
gsed -i  "s/^\( *version *\).*$/\1'$VERSION'/"                                          android/build.gradle


exit 0








