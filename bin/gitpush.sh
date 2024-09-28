#!/bin/bash
if [ -z "$1" ]; then
        echo "Correct usage is $0 <Comment>"
        exit -1
fi



COMMENT=$1

cd taudoc
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..

cd taudio
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..

cd taulabs
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..

cd tauwars
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..

cd tauweb
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..

cd lab_sound_bridge
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..

cd lab_sound_flutter
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..

git add .
git commit -m "$COMMENT"
git pull
git push
cd ..


exit 0

# ----------------------------------------------------------------------------------------

