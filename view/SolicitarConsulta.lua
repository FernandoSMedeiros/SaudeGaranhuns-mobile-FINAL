local composer = require( "composer" )
local widget = require( "widget" )

local mui = require( "materialui.mui" )
local muiData = require( "materialui.mui-data" )
 
local controller = require("controller.ConsultaController")
--local consultaController = controller:criar()

local consultaController = nil

local scene = composer.newScene() 
 
local salvar = function()
 
  local paciente = composer.getVariable("Paciente") 
  consultaController.consulta.especialidade = mui.getWidgetProperty("especialidade", "value")
  consultaController.consulta.prioridade = mui.getWidgetProperty("prioridade", "value")
  consultaController.consulta.paciente = paciente
  
  -- mui.getWidgetProperty("prioridade", "value")  

  consultaController:salvar()

end
 
 
local centerX = display.contentCenterX
local centerY = display.contentCenterY

function scene:create( event )    
    local sceneGroup = self.view 
end
 
function scene:show( event )
 
    consultaController = controller:criar()

    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    mui.init()

    local numOfRowsToShow = 2
        mui.newSelect({
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

    local numOfRows = 4
    mui.newSelect({
        name = "prioridade",
        labelText = "Prioridade",
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
        listHeight = 30 * numOfRows,
        x = centerX,
        y = centerY - 100,
        callBackTouch = mui.onRowTouchSelector,
        scrollListener = nil,
        list = { -- if 'key' use it for 'id' in the table row
            { key = "1", text = "Nenhuma", value = "NENHUMA", isCategory = false,},
            { key = "2", text = "Gestante", value = "GESTANTE", isCategory = false },
            { key = "3", text = "Idoso", value = "IDOSO", isCategory = false },
            { key = "4", text = "Bebe de colo", value = "BEBEDECOLO", isCategory = false },
            { key = "5", text = "Deficiente", value = "DEFICIENTE", isCategory = false },
        
        },
        scrollView = scrollView
    })


mui.newRectButton({
    parent = mui.getParent(),
    name = "solicitar",
    text = "Solicitar Consulta",
    width = 150,
    height = 30,
    x = centerX,
    y = 426,
    font = native.systemFont,
    fontSize = 16,
    fillColor = { 0.25, 0.75, 1, 1 },
    textColor = { 1, 1, 1 },    
    iconFontColor = { 1, 1, 1, 1 },
    touchpoint = true,
    callBack = salvar
    
})


    mui.getWidgetProperty("prioridade", "object").x = centerX
    mui.getWidgetProperty("prioridade", "object").y = centerY - 100

    mui.getWidgetProperty("especialidade", "object").x = centerX
    mui.getWidgetProperty("especialidade", "object").y = centerY   

    end
end

-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
    inputObservacao:removeSelf()
 
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