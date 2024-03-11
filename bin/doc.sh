#!/bin/bash

VERSION=$1

rm -r doc/pages/tau/api/* 2>/dev/null
rm -r doc/_site *

if [ ! -z "$VERSION" ]; then
        echo "Setting the tau version"
        gsed -i  "s/^TAU_VERSION:.*/TAU_VERSION: $VERSION/"                                     doc/_config.yml
        gsed -i  "s/^\( *version: \).*/\1$VERSION/"                                             doc/_data/sidebars/mydoc_sidebar.yml
fi

rm -rf example/build build
tar czf _toto3.tgz extract
cd doc
tar czf ../_toto.tgz *
cd ..
scp bin/doc2.sh canardoux@danku:/home/tau/bin
scp _toto.tgz canardoux@danku:/home/tau
scp _toto3.tgz canardoux@danku:/home/tau
exit 0
ssh canardoux@danku "bash /home/tau/bin/doc2.sh"
#rm _toto.tgz _toto2.tgz _toto3.tgz 2>/dev/null

echo 'E.O.J'
