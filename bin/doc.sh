#!/bin/bash

VERSION=$1

rm -r doc/pages/api 2>/dev/null
rm -r doc/_site/* 2>/dev/null
rm -r doc/api 2>/dev/null

if [ ! -z "$VERSION" ]; then
        echo "Setting the tau version"
        gsed -i  "s/^TAU_VERSION:.*/TAU_VERSION: $VERSION/"                                     doc/_config.yml
        gsed -i  "s/^\( *version: \).*/\1$VERSION/"                                             doc/_data/sidebars/mydoc_sidebar.yml
fi

flutter clean
flutter pub get

flutter analyze
if [ $? -ne 0 ]; then
    echo "Error"
    exit -1
fi

dart doc 
if [ $? -ne 0 ]; then
    echo "Error"
    exit -1
fi

gsed -i  "0,/^  overflow: hidden;$/s//overflow: auto;/"  doc/api/static-assets/styles.css
gsed -i  "s/^  background-color: inherit;$/  background-color: #2196F3;/" doc/api/static-assets/styles.css



echo "Add Front matter on top of dartdoc pages"
for f in $(find doc/api -name '*.html' )
do
        gsed -i  "1i ---" $f
        gsed -i  "1i toc: true" $f
        gsed -i  "1i ---" $f
        gsed -i  "/^<script src=\"https:\/\/ajax\.googleapis\.com\/ajax\/libs\/jquery\/3\.2\.1\/jquery\.min\.js\"><\/script>$/d" $f
done





echo "Building Jekyll doc"
cd doc
rm home.md 2>/dev/null

bundle config set --local path '~/vendor/bundle'
bundle install
bundle exec jekyll build

if [ $? -ne 0 ]; then
    echo "Error"
    exit -1
fi

cd ..

mv doc/api doc/_site
cd doc/_site
echo "Symbolic links of the API"
echo "--------------------------"
for dir in $(find api -type d)
do
        rel=`realpath --relative-to=$dir .`
        echo "----- dir=$dir ----- rel=$rel"
        for d in */ ; do
            ln -s -v $rel/$d $dir
        done
done
ln -s -v readme.html index.html
cd ../..

exit 0

rm -rf example/build build
tar czf _toto3.tgz extract
cd doc/_site
tar czf ../_toto.tgz *
cd ../..
scp bin/doc2.sh canardoux@danku:/home/canardoux/bin
scp _toto.tgz canardoux@danku:/home/canardoux
scp _toto3.tgz canardoux@danku:/home/canardoux
ssh canardoux@danku "bash /home/canardoux/bin/doc2.sh"
#rm _toto.tgz _toto2.tgz _toto3.tgz 2>/dev/null

echo 'E.O.J'
