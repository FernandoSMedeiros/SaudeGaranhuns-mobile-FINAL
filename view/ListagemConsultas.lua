local composer = require( "composer" )
local widget = require( "widget" ) 
local mui = require( "materialui.mui" )
local muiData = require( "materialui.mui-data" )
local json = require("json")

local scene = composer.newScene()

local touch = function (event)
    print(mui.getWidgetProperty("teste", "value"))
    composer.setVariable( "detalhe", {nome = "Fernando"}--[[mui.getWidgetProperty("teste", "value")--]] )
    composer.gotoScene("view.DetalhesConsulta")
end

function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
  
-- show()
function scene:show( event )

   
    local jsonT = '[{"id" : "1", "nome" : "Fernando"}, {"id" : "2", "nome" : "k"}, {"id" : "3", "nome" : "e"}, {"id" : "4", "nome" : "a"}]'
    -- -------
    local tab = json.decode(jsonT)


    local sceneGroup = self.view
    local phase = event.phase

    mui.init()
 
    if ( phase == "will" ) then
        
 
    elseif ( phase == "did" ) then

    local list = { }

    for k, v in pairs(tab) do      
        table.insert(list, { key = tab[k].id, text = tab[k].nome, value = k, isCategory = false })
    end
   
    mui.newTableView({
    parent = sceneGroup,
    name = "teste",
    width = display.contentWidth,
    height = display.contentHeight - 50,
    top = 0,
    left = 0, --muiData.safeAreaWidth - 190,
    font = native.systemFont,
    fontSize = 9,
    textColor = { 0, 0, 0, 1 },
    lineColor = { 1, 1, 1, 1 },
    lineHeight = 2,
    rowColor = {1, 1, 1, 1}, --{ default={1,1,1}, over={1,0.5,0,0.2} },
    rowHeight = 20,
    -- rowAnimation = false, -- turn on rowAnimation
    noLines = false,
    callBackTouch = touch, --mui.onRowTouchDemo,
    callBackRender = mui.onRowRenderDemo,
    scrollListener = mui.scrollListener,  -- needed if using buttons, etc within the row!
    list = list,
    columnOptions = {
        widths = { 60, 60, 60 }, -- must supply each else "auto" is assumed.
    },
    categoryColor = { default={0.8,0.8,0.8,0.8} },
    categoryLineColor = { 1, 1, 1, 0 },
    --touchpointColor = { 0.4, 0.4, 0.4 },
})   

    mui.newRectButton({
        parent = sceneGroup,
        name = "voltarParaListaConsultas",
        text = "Voltar",
        width = 150,
        height = 40,
        x = display.getContentCenterX,
        y = display.contentCenterY+220,
        font = native.systemFont,
        fontSize = 16,
        fillColor = { 0.25, 0.75, 1, 1 },
        textColor = { 1, 1, 1 },
        touchpoint = true,        
        callBack = mui.actionSwitchScene,
        callBackData = {
            sceneDestination = "view.MenuPrincipal",
            sceneTransitionColor = { 0.73, 0.73, 1 },
            sceneTransitionAnimation = false
        }   
    })  

    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
  
-- destroy()
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