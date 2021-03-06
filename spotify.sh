#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title play
# @raycast.mode silent
# @raycast.icon https://play-lh.googleusercontent.com/dwyqtk9CgAaoXUcYB8pUHXRErF5A2Shd0UrZdBLkpAFx_e630aZahwN31HRZWNksIQ
# @raycast.argument1 { "type": "text", "placeholder": "track" }

source ./secrets.sh

if ! pgrep -xq -- "Spotify"; then
	open -a Spotify -jg
fi

data=$(curl -G -X "GET" "https://api.spotify.com/v1/search" --data-urlencode "q=$*" --data-urlencode "type=track" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer $SPOTIFY_TOKEN" | jq -r '.tracks.items | first')

artist=$(jq -r '.artists | first' <<< $data)
track=$(jq -r '{ name: .name, uri: .uri }' <<< $data)

osascript -e 'tell application "Spotify"' -e 'play track "'"$(jq -r '.uri' <<< $track)"'"' -e 'end tell'

echo "Now playing: $(jq -r '.name' <<< $artist) - $(jq -r '.name' <<< $track)"
