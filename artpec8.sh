#!/bin/sh

# Change to the directory where this script is located
cd "$(dirname "$0")" || exit 1

docker build --build-arg ARCH=aarch64 --build-arg CHIP=artpec8 --tag inference .
docker cp $(docker create inference):/opt/app ./build
mv build/*.eap .
rm -rf build
