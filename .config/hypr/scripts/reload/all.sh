#!/bin/sh

# Runs all the adjacent reset scripts.

THIS_DIR="$(cd "$(dirname "$0")" && pwd)"
THIS_SCRIPT="$(basename "$0")"

for item in "$THIS_DIR"/*; do
    if [[ "$(basename "$item")" == "$THIS_SCRIPT" ]]; then
        continue
    fi

    # Run only executable files.
    if [[ -f "$item" && -x "$item" ]]; then
        "$item"
    fi
done
