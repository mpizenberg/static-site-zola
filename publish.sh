#!/usr/bin/env bash

# Requires to have configured worktree with
# git worktree add gh-pages-static/ gh-pages

set -e
zola build --base-url https://mpizenberg.github.io/static-site-zola
cd gh-pages-static
git reset --hard 9490b60
cp -rH ../public/* .
git add . --force
git commit -m "Publish"
git push --force
