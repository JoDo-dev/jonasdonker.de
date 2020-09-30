#!/usr/bin/env sh

# abort on errors
set -e


git checkout release
git pull
git merge master
# build
npm run build

# navigate into the build output directory
cd dist

git add -A
git commit -m 'deploy'

git push

cd -