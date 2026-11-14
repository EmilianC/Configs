#!/bin/sh

THIS_DIR="$(cd "$(dirname "$0")" && pwd)"

$THIS_DIR/waybar.sh
$THIS_DIR/wob.sh
