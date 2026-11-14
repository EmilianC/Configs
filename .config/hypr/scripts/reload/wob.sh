#!/bin/sh

killall wob

# Restart and pipe wob to listen to the pipe.
tail -f /tmp/wob_volume_change_listen_pipe | wob & disown
