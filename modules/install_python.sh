#!/usr/bin/env bash

set -ue
source modules/lib/logging.sh

me="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

log::info "$me cool"
echo "$(readlink -f "${BASH_SOURCE[0]}")"
