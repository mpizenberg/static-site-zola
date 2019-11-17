#!/usr/bin/env bash

# CF publish-gh-pages for this script doc.

set -e
zola build --base-url "https://matthieu.pizenberg.fr"
cd netlify
git reset --hard 36ffc4fbe
cp -rH ../public/* .
git add . --force
git commit -m "Publish"
git push --force
