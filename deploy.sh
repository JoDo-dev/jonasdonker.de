#!/usr/bin/env sh

# abort on errors
set -e

# build
npm run build

# navigate into the build output directory
cd dist

git init new
git add -A
git commit -m 'deploy'

git push new:release

cd -