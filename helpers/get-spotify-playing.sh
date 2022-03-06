echo `/usr/bin/osascript << EOT
	tell application "Spotify"
		return (get artist of current track) & " – " & (get name of current track)
	end tell
EOT`
