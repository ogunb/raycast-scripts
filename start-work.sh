#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title work
# @raycast.mode silent
# @raycast.icon 🃏

osascript &>/dev/null <<EOF
  tell application "iTerm"
    tell current session of current window
      set response to do shell script "echo ready"
      write text "startwork"
    end tell
  end tell
EOF
