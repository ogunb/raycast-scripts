#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title refresh credentials
# @raycast.mode silent
# @raycast.icon https://play-lh.googleusercontent.com/dwyqtk9CgAaoXUcYB8pUHXRErF5A2Shd0UrZdBLkpAFx_e630aZahwN31HRZWNksIQ

source ./secrets.sh

access_token=$(curl -X "POST" -H "Authorization: Basic $SPOTIFY_APP_BASIC_TOKEN=" -d grant_type=client_credentials https://accounts.spotify.com/api/token | jq -r '.access_token')
sed -i '' "s/SPOTIFY_TOKEN.*$/SPOTIFY_TOKEN=$access_token/g" secrets.sh
