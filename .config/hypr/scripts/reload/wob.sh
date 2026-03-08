#!/bin/sh

killall wob

# Restart and listen hook wob to listen to the pipe.
tail -f /tmp/wob_volume_change_listen_pipe | wob & disown
