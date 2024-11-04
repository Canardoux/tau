#!/bin/bash
if [ -z "$1" ]; then
        echo "Correct usage is $0 <Comment>"
        exit -1
fi



COMMENT=$1

cd etau
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

cd tau_labs
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

