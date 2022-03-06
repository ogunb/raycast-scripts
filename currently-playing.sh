#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title currenly playing
# @raycast.mode compact
# @raycast.icon 🎶

is_spotify_running=$(bash ./helpers/is-app-running.sh spotify)
if $is_spotify_running; then
  echo $(bash ./helpers/get-spotify-playing.sh)
  exit
fi

is_chrome_running=$(bash ./helpers/is-app-running.sh chrome)
if $is_chrome_running; then
  echo $(bash ./helpers/get-youtube-music-playing.sh)
  exit
fi
