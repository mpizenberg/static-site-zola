#!/usr/bin/env bash

# Create orphan branch "gh-pages"
# git checkout --orphan gh-pages
# git rm -rf .
# git commit --allow-empty -m "Init empty branch"
# git push origin gh-pages -u

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
