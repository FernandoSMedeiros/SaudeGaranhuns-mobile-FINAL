local composer = require( "composer" )
local data = require("controller.DataDisponivelController")
local dataModel = require("model.DataDisponivelModel")
local json = require("json")
local mui = require( "materialui.mui" )
local muiData = require( "materialui.mui-data" )

local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
local touch = function (event)
    
    --print(mui.getWidgetProperty("datas", "value"))
    valor  = mui.getWidgetProperty("datas", "value")    
    composer.setVariable( "dataConsulta", tab[valor])

    --print(tab[valor].day .. '/' .. tab[valor].month .. '/' .. tab[valor].year)

    composer.gotoScene("view.SolicitarConsulta")

end 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local especialidade = composer.getVariable("datasDisponiveis").especialidade
    local idPaciente = composer.getVariable("datasDisponiveis").idPaciente

    data = data:criar()
    datas = data:buscar(idPaciente, especialidade)    
    tab = datas
    list = {}

    mui.init()
    local sceneGroup = self.view
    
    if tab ~= nil then
        for k, v in pairs(tab) do      
            table.insert(list, { key = tab[k].id, text = tab[k].day .. '/' .. tab[k].month .. '/' .. tab[k].year, value = k, isCategory = false })
        end 
    end    
    --print(composer.getVariable("datasDisponiveis"))   
    
end 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
   
    elseif ( phase == "did" ) then

    mui.newTableView({
        parent = sceneGroup,
        name = "datas",        
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
        fontSize = 25,
        rowHeight = 28,
        columnOptions = {
            widths = { 60, 60, 60 }, -- must supply each else "auto" is assumed.
        },
        categoryColor = { default={0.8,0.8,0.8,0.8} },
        categoryLineColor = { 1, 1, 1, 0 },
        --touchpointColor = { 0.4, 0.4, 0.4 },
    })

    mui.newRectButton({
        parent = sceneGroup,
        name = "voltar",
        text = "Voltar",
        width = 150,
        height = 30,
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