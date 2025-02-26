#!/bin/bash
if [ -z "$1" ]; then
        echo "Correct usage is $0 <Comment>"
        exit -1
fi



COMMENT=$1
# ================================== Flutter Sound ================================

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

echo '==========> flutter_sound_platform_interface'
cd flutter_sound_platform_interface
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..

# =================================== Etau ========================================

echo '==========> etau'
cd etau
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..


echo '==========> tau_war'
cd tauwar
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..

echo '==========> tau_web'
cd tauweb
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..

# =================================== Taudio ========================================


echo '==========> taudio'
cd taudio
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..



# =============================== The docs ========================

echo '==========> fs-doc'
cd fs-doc
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..


echo '==========> taudio-doc'
cd taudio-doc
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..


echo '==========> etau-doc'
cd etau-doc
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..



# ================================= Tau ============================

echo '==========> tau'
git add .
git commit -m "$COMMENT"
git pull
git push
cd ..


exit 0

# ----------------------------------------------------------------------------------------

