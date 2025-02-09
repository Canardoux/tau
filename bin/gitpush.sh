#!/bin/bash
if [ -z "$1" ]; then
        echo "Correct usage is $0 <Comment>"
        exit -1
fi



COMMENT=$1

echo '==========> flutter_sound'
cd flutter_sound
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..

echo '==========> flutter_sound_web'
cd flutter_sound_web
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..

echo '==========> flutter_sound_core'
cd flutter_sound_core
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..

echo '==========> flutter_sound_plateform_interface'
cd flutter_sound_plateform_interface
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..

echo '==========> etau'
cd etau
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..

echo '==========> tau_chrome'
cd tau_chrome
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..

echo '==========> tau_doc'
cd tau_doc
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..

echo '==========> taudio'
cd taudio
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..

echo '==========> tau_wars'
cd tau_wars
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..

echo '==========> tau_web'
cd tau_web
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..

echo '==========> tau_core'
cd tau_core
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..

echo '==========> tau_ffi'
cd tau_ffi
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..

echo '==========> tau'
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..


exit 0

# ----------------------------------------------------------------------------------------

