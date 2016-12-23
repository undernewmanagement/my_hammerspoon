hyper = {"ctrl", "alt", "cmd"}
hypershift = {"ctrl", "alt", "cmd", "shift"}

hs.window.animationDuration = 0.25

require('watcher')
require('position')
require('extras')

-- Pop a hammerspoon REPL to test out commands (optional)
hs.hotkey.bind(hyper, "R", hs.openConsole )