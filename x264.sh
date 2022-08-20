#!/bin/bash
set -e

savedir="$PWD"
workdir="$(mktemp -d)"
cd "$workdir"

git clone https://code.videolan.org/videolan/x264.git
cd x264
VERSION="$(./version.sh | grep POINTVER | cut -d' ' -f3 | sed 's/"//')"
cd ..
mv x264 x264-"$VERSION"
tar -cJf "$savedir"/x264-"$VERSION".tar.xz x264-"$VERSION"

cd "$savedir"
rm -rf "$workdir"
