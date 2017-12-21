local composer = require("composer")
local widget = require("widget")

display.setDefault( "background", 1, 1, 1 )
display.setStatusBar(display.HiddenStatusBar)

composer.gotoScene("view.Login")