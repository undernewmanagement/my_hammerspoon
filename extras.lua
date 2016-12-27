extra_log = hs.logger.new('extras','debug')
extra_log.i('Initializing') -- will print "[mymodule] Initializing" to the console

function pop_logs()

    local script2 = [[
        tell application "Terminal"
            if not (exists window 1) then reopen
            activate
            do script ("exec -a %s %s %s") in window 1
        end tell
    ]]

    local cmd = string.format(script2, logviewername, logviewprogram, logfile)

    local dohide = false

    logwindow = hs.appfinder.windowFromWindowTitlePattern(logviewername)

    if (logwindow == nil)
    then
        hs.osascript.applescript(cmd)

        while logwindow == nil do
            logwindow = hs.appfinder.windowFromWindowTitlePattern(logviewername)
            extra_log.i('boom')
        end

        local f = logwindow:frame()
        local screen = logwindow:screen()
        local max = screen:frame()

        f.x = max.x + (max.w / 2)
        f.y = max.y
        f.w = max.w / 2
        f.h = max.h
        logwindow:setFrame(f)
    elseif logwindow:isVisible() then
        dohide = true
    end
        
    logwindow:unminimize()
    logwindow:raise()

    local app = hs.appfinder.appFromWindowTitlePattern(logviewername)

    if dohide then
        app:hide()
    else
        app:activate()
        app:unhide()
    end

    extra_log.i('your mom goes to college')

--[[
	local script = [[
		tell application "iterm2"
			set logWindow to (create window with default profile command "exec -a qwfmlogs lnav ~/src/qwfm-docker/logs/debug.log")
(*
			set logWindow to (create window with default profile command "tail -f ~/src/qwfm-docker/logs/debug.log")
			tell current session of logWindow
				split horizontally with default profile command "tail -f ~/src/qwfm-docker/logs/error.log"
			end tell
*)
		end tell
	]]
--]]

end

hs.hotkey.bind(hyper, "L", pop_logs )

