echo `/usr/bin/osascript << EOT
	tell application "Google Chrome"
		repeat with t in tabs of windows
			tell t
				if the title contains "Youtube Music" then
					return execute javascript "document.querySelector('.ytmusic-player-bar.title').title"
				end if
			end tell
		end repeat
	end tell
EOT`
