#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

git config --global user.email "jdtatsch@gmail.com"
git config --global user.name "jdtatsch"

git clone -b gh-pages https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git bookdown-demo-out
cd bookdown-demo-out
cp -r ../_book/* ./
git add --all *
git commit -m "Update the bookdown-demo" || true
git push -q origin gh-pages
