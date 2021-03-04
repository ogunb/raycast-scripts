#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title play
# @raycast.mode silent
# @raycast.icon https://play-lh.googleusercontent.com/dwyqtk9CgAaoXUcYB8pUHXRErF5A2Shd0UrZdBLkpAFx_e630aZahwN31HRZWNksIQ
# @raycast.argument1 { "type": "text", "placeholder": "track" }

if ! pgrep -xq -- "Spotify"; then
	open -a Spotify -jg
fi

SPOTIFY_TOKEN=
URI=$(curl -G -X "GET" "https://api.spotify.com/v1/search" --data-urlencode "q=$*" --data-urlencode "type=track" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer $SPOTIFY_TOKEN" | jq -r '.tracks.items | first | .uri')

echo "URI is: $URI"

osascript -e 'tell application "Spotify"' -e 'play track "'"$URI"'"' -e 'end tell'

echo "Now playing: $*"