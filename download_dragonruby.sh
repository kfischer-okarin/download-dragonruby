#!/bin/bash

set -e

version=$1
license_tier=$2

if [[ $RUNNER_OS == "Linux" ]]; then
  platform="linux-amd64"
elif [[ $RUNNER_OS == "macOS" ]]; then
  platform="macos"
elif [[ $RUNNER_OS == "Windows" ]]; then
  platform="windows-amd64"
else
  echo "Unknown platform $RUNNER_OS"
  exit 1
fi

base_url="https://github.com/kfischer-okarin/dragonruby-for-ci/releases/download/$version"
filename="dragonruby-for-ci-$version-$license_tier-$platform.zip"

curl -L -o dragonruby.zip $base_url/$filename
unzip dragonruby.zip
chmod u+x ./dragonruby
