#!/bin/bash
if [ -z "$1" ]; then
        echo "Correct usage is $0 <Comment>"
        exit -1
fi



COMMENT=$1

cd flutter_sound
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..

cd flutter_sound_wev
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..

cd flutter_sound core
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..

cd flutter_soundPlateform_interface
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..

cd etau
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..

cd tau_chrome
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..

cd tau_doc
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

cd tau_wars
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..

cd tau_web
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..

cd tau_core
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..

cd tau_ffi
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

