#!/usr/bin/env sh

# abort on errors
set -e

npm run build

git checkout release

# navigate into the build output directory
cd dist
git init
git add -A
git commit -m 'deploy'

git push

git checkout master

cd -