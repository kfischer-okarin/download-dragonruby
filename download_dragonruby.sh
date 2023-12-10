#!/bin/bash

set -e

version=$1

base_url="https://github.com/kfischer-okarin/dragonruby-for-ci/releases/download/$version"
filename="dragonruby-for-ci-$version-standard-linux-amd64.zip"

curl -L -o dragonruby.zip $base_url/$filename
unzip dragonruby.zip
chmod u+x ./dragonruby
