#!/bin/sh
set -eu

LEGO_COMMAND=run /scripts/run.sh
crond -f
