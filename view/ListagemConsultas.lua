local composer = require( "composer" )
local widget = require( "widget" ) 
local mui = require( "materialui.mui" )
local muiData = require( "materialui.mui-data" )
local consulta = require("controller.ConsultaController")
local json = require("json")

local scene = composer.newScene()

local controller = consulta:criar()
local idPaciente = json.decode(composer.getVariable("pacienteLogado"))
tab = controller:buscar(idPaciente.id)
print(tab)
list = {}

local touch = function ()
    local id = mui.getWidgetProperty("detalhar", "value")
    local detalhar = tab[id]

    composer.setVariable("detalhe", detalhar)
    composer.gotoScene("view.DetalhesConsulta")
end

function scene:create( event )
 
    local sceneGroup = self.view
    
    print(idPaciente.id)

end
  
-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    for k, v in pairs(tab) do      
        table.insert(list, { key = tab[k].id, text = "Data Consulta: " .. tab[k].dataAgendamento.day .. "/" .. tab[k].dataAgendamento.month .. "/" .. tab[k].dataAgendamento.year .. "\nStatus: " .. tab[k].status .. "\nEspecialidade: " .. tab[k].especialidade, 
                           value = k, isCategory = false })
    end

    mui.init()
 
    if ( phase == "will" ) then
        
 
    elseif ( phase == "did" ) then

    mui.newTableView({
    parent = sceneGroup,
    name = "detalhar",
    width = display.contentWidth,
    height = display.contentHeight - 50,
    top = 0,
    left = 0,
    font = native.systemFont,
    fontSize = 5,
    textColor = { 0, 0, 0, 1 },
    lineColor = { 1, 1, 1, 1 },
    lineHeight = 2,
    rowColor = {1, 1, 1, 1},
    rowHeight = 20,   
    noLines = false,
    callBackTouch = touch,
    callBackRender = mui.onRowRenderDemo,
    scrollListener = mui.scrollListener,
    list = list,
    fontSize = 10,
    rowHeight = 40,
    columnOptions = {
        widths = { 60, 60, 60 },
    },
    categoryColor = { default={0.8,0.8,0.8,0.8} },
    categoryLineColor = { 1, 1, 1, 0 },
    
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