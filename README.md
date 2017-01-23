# my_hammerspoon
This is my hammerspoon config. 

I don't remember where these are borrowed from. I will update and give credit
where it is due when I have time.

## Installing

 1. `git clone https://github.com/undernewmanagement/my_hammerspoon.git ~/.hammerspoon`
 2. `cd ~/.hammerspoon && cp variables.lua.sample variables.lua`
 3. `cd ~/.hammerspoon && cp custom.lua.sample custom.lua`

If you want to use the log view shortcut (`ctrl` + `alt` + `command` + `L`), then you will neeed
edit the variables.lua file and point it to the log files you want to watch. 

## Window resizing
TODO


## Loading the Hammerspoon Lua REPL

`ctrl` + `option` + `cmd` + `R`


# variables.lua
This file is specific to your installation and therefore ignored by the git repo. Put
your custom settings set custom variables specific to your environment

# custom.lua
This is just like `variables.lua` except that it if for custom functions, bindings, etc.


