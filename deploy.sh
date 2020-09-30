#!/usr/bin/env sh

# abort on errors
set -e
npm ci
npm run build

git checkout release
git merge master

rm /*
rmdir -r public src
mv -v /dist/* /
# navigate into the build output directory
git add -A
git commit -m 'deploy'

git push

git checkout master

cd -