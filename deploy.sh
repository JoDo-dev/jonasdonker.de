#!/usr/bin/env sh

# abort on errors
set -e

npm run build

git checkout release
git merge master

# navigate into the build output directory
cd dist
git add -A
git commit -m 'deploy'

git push

git checkout master

cd -