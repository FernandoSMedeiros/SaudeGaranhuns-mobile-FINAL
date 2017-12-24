local mui = require( "materialui.mui" )
local muiData = require( "materialui.mui-data" )

local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
local ver = function()
    
    local verDatas = '{' .. "especialidade" .. ':' .. '"' .. mui.getWidgetProperty("especialidade", "value") .. '"' .. ' , ' 
                         .. "paciente" .. ':' .. composer.getVariable("pacienteLogado") .. '}'

    composer.setVariable("datasDisponiveis", verDatas)
    composer.setVariable("especialidade", mui.getWidgetProperty("especialidade", "value"))

    composer.gotoScene("view.DataDisponivel")
end 
  
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    mui.init()

end
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
       
    local numOfRowsToShow = 2
        mui.newSelect({
        parent = sceneGroup,    
        name = "especialidade",
        labelText = "Especialidade",
        --text = "selecione",
        font = native.systemFont,
        textColor = { 0.4, 0.4, 0.4 },
        fieldBackgroundColor = { 1, 1, 1, 1 },
        rowColor = { default={ 1, 1, 1, 1 }, over={ 1, 0.5, 0, 0.2 } }, -- default is the highlighting
        rowBackgroundColor = { 1, 1, 1, 1 }, -- the drop down color of each row
        touchpointColor = { 0.4, 0.4, 0.4 }, -- the touchpoint color
        activeColor = { 0.12, 0.67, 0.27, 1 },
        inactiveColor = { 0.4, 0.4, 0.4, 1 },
        strokeColor = { 0.4, 0.4, 0.4, 1 },
        strokeWidth = 2,
        width = 200,
        height = 30,
        listHeight = 30 * numOfRowsToShow,
        x = 120,
        y = 240,
        callBackTouch = mui.onRowTouchSelector,
        scrollListener = nil,
        list = { -- if 'key' use it for 'id' in the table row
            { key = "1", text = "Geral", value = "GERAL", isCategory = false},
            { key = "2", text = "Dentista", value = "DENTISTA", isCategory = false },
        
        },
        scrollView = scrollView,
    })

    mui.newRectButton({
        parent = sceneGroup,
        name = "verDatas",
        text = "Datas Disponíveis",
        width = 150,
        height = 30,
        x = centerX,
        y = 400,
        font = native.systemFont,
        fontSize = 16,
        fillColor = { 0.25, 0.75, 1, 1 },
        textColor = { 1, 1, 1 },    
        iconFontColor = { 1, 1, 1, 1 },
        touchpoint = true,
        callBack = ver    
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