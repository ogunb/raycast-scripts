#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title currenly playing
# @raycast.mode compact
# @raycast.icon https://play-lh.googleusercontent.com/dwyqtk9CgAaoXUcYB8pUHXRErF5A2Shd0UrZdBLkpAFx_e630aZahwN31HRZWNksIQ

echo $(osascript -e 'tell application "Spotify"' -e 'return (get artist of current track) & " – " & (get name of current track)' -e 'end tell')
