#!/bin/bash

set -e

curl -s "https://api.github.com/repos/kfischer-okarin/dragonruby-for-ci/releases/latest" | jq -r ".name"
