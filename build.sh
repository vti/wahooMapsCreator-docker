#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

docker build . -t wahoo-maps-creator "$@"
