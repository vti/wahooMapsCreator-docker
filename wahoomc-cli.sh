#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

ARGS=("${@}")

docker run --rm \
	-v "${PWD}/data/wahooMapsCreatorData:/root/wahooMapsCreatorData:Z" \
	-v "${PWD}:/app:Z" \
	wahoo-maps-creator \
	"${ARGS[@]}"
