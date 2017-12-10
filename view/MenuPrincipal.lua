local composer = require( "composer" )
 
local mui = require( "materialui.mui" )
local muiData = require( "materialui.mui-data" )

local scene = composer.newScene()
 


function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end 

function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then

    mui.init()

    mui.newRectButton({
        parent = sceneGroup,
        name = "solicitarConsulta",
        text = "Nova Consulta",
        width = 150,
        height = 40,
        x = display.getContentCenterX,
        y = display.contentCenterY,
        font = native.systemFont,
        fontSize = 16,
        fillColor = { 0.25, 0.75, 1, 1 },
        textColor = { 1, 1, 1 },        
        touchpoint = true,        
        callBack = mui.actionSwitchScene,
        callBackData = {
            sceneDestination = "scenes.SolicitarConsulta",
            sceneTransitionColor = { 0.73, 0.73, 1 },
            sceneTransitionAnimation = false
        }    
    })

    mui.newRectButton({
        parent = sceneGroup,
        name = "verConsulta",
        text = "Ver Consultas",
        width = 150,
        height = 40,
        x = display.getContentCenterX,
        y = display.contentCenterY-50,
        font = native.systemFont,
        fontSize = 16,
        fillColor = { 0.25, 0.75, 1, 1 },
        textColor = { 1, 1, 1 },
        touchpoint = true,        
        callBack = mui.actionSwitchScene,
        callBackData = {
            sceneDestination = "scenes.ListagemConsultas",
            sceneTransitionColor = { 0.73, 0.73, 1 },
            sceneTransitionAnimation = false
        }   
    })

    --mui.getRoundedRectButtonProperty("solicitarConsulta", "text").x = display.contentCenterX 
    --mui.getRoundedRectButtonProperty("verConsulta", "text").x = display.contentCenterX
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end

function scene:destroy( event )
 
    local sceneGroup = self.view
    
    sceneGroup:removeSelf()
    sceneGroup = nil
    mui.destroy()
 
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene