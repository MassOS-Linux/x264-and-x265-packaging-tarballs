#!/bin/bash
set -e

savedir="$PWD"
workdir="$(mktemp -d)"
cd "$workdir"

git clone https://bitbucket.org/multicoreware/x265_git.git
cd x265_git
VERSION="$(git describe --tags)"
rm -rf .git
cd ..
mv x265_git x265-"$VERSION"
tar -cJf "$savedir"/x265-"$VERSION".tar.xz x265-"$VERSION"

cd "$savedir"
rm -rf "$workdir"
