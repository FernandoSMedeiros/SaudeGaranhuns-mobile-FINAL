local composer = require("composer")
local widget = require("widget")

display.setDefault( "background", 0.40, 0.56, 0.70 )
display.setStatusBar(display.HiddenStatusBar)

composer.gotoScene("view.Login")