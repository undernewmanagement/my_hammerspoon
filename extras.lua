function pop_logs()
	local script = [[
		tell application "iterm2"
			set logWindow to (create window with default profile command "tail -f ~/src/qwfm-docker/logs/debug.log")
			tell current session of logWindow
				split horizontally with default profile command "tail -f ~/src/qwfm-docker/logs/error.log"
			end tell
		end tell
	]]

	hs.osascript.applescript(script)
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x + (max.w / 2)
	f.y = max.y
	f.w = max.w / 2
	f.h = max.h
	win:setFrame(f)
end

hs.hotkey.bind(hyper, "L", pop_logs )
