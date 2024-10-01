#!/bin/sh

# Change to the directory where this script is located
cd "$(dirname "$0")" || exit 1

docker build --build-arg ARCH=armv7hf --build-arg CHIP=cpu --tag inference_arm .
docker cp $(docker create inference_arm):/opt/app ./build
mv build/*.eap .
rm -rf build
