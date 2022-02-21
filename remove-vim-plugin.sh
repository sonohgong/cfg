#!/bin/sh
URL=$1
NAME=$(basename $URL .git)
git rm nvim/site/pack/bundle/opt/$NAME
rm -rf .git/modules/$NAME
git config --remove-section submodule.$NAME
