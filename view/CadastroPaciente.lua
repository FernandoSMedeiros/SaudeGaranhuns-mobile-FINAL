local controller = require("controller.PacienteController")

local composer = require( "composer" )

local mui = require( "materialui.mui" )
local muiData = require( "materialui.mui-data" ) 
local scene = composer.newScene()

local lista = nil
--lista = postoController.todos()

lista = {
  {id= 1,nome="posto são vicente", endereco={logradouro="blá", numero="20", bairro="centro"}},
  {id= 2,nome="posto são mario", endereco={logradouro="blá", numero="23", bairro="bela vista"}},
  {id= 3,nome="posto são joao", endereco={logradouro="blá", numero="12", bairro="quatis"}},
  {id= 4,nome="posto pracinha", endereco={logradouro="blá", numero="4", bairro="santa rosa"}},
}
 
local salvar = function()
  
  controller.paciente.nome = mui.getTextFieldProperty("nome", "value")
  controller.paciente.cartaoSus = mui.getTextFieldProperty("cartao", "value")
  controller.paciente.dataNasc = mui.getTextFieldProperty("dataNasc", "value")
  controller.paciente.posto.nome = "posto pracinha"
  controller.paciente.posto.endereco.logradouro = "rua da tanajura selvagem"
  controller.paciente.posto.endereco.numero = 0
  controller.paciente.posto.endereco.bairro.nome = "santa rosa"
  
  -- = {id= 4,nome="posto pracinha", endereco={logradouro="blá", numero="4", bairro="santa rosa"}}
  --Adiciona a tabela posto ao atributo posto do controller, no select ele não pode receber a tabela
  -- id=mui.getTextFieldProperty("posto", "value")
  -- for i,v in ipairs(lista) do
  --   if id == lista[i].id then
  --     pacienteController.paciente.posto = lista[i]
  --     break
  --   end
  -- end

  controller:salvar()

end

local function listaSelect()
  local retorno = {}

  local i = 0
  for i,v in ipairs(lista) do
    local linha = {key = "row"..i, text = lista[i].nome, value = lista[i].id, isCategory = false}
    table.insert(retorno, linha)
  end

  --[[for k,v in pairs(lista) do
    local linha = {key = i, text = k.nome, value = k, isCategory = false}
    table.insert(retorno, linha)
    i = i + 1
  end]]
  return retorno
end
 
function scene:create( event )
 
    local sceneGroup = self.view    
    pacienteController = controller:criar()
 
end
 
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
     
    if ( phase == "will" ) then
        
        mui.init()

    display.newRect(sceneGroup, display.contentCenterX, 0, 320, 38 ).setFillColor = {1, 0, 1}
           
    mui.newTextField({
      parent = sceneGroup,
      labelText = "Nome",
      name = "nome",      
      font = native.systemFont,
      width = 200,
      height = 24,
      x = display.contentCenterX,
      y = 82,
      trimAtLength = 5,
      activeColor = { 0, 1, 1, 1 },
      inactiveColor = { 0.5, 0.5, 0.5, 1 },
      callBack = mui.textfieldCallBack
    })

    mui.newTextField({
      parent = sceneGroup,
      labelText = "Cartão do SUS",
      name = "cartao",      
      font = native.systemFont,
      width = 200,
      height = 24,
      x = display.contentCenterX,
      y = 82+(30*2),
      trimAtLength = 5,
      activeColor = { 0, 1, 1, 1 },
      inactiveColor = { 0.5, 0.5, 0.5, 1 },
      callBack = mui.textfieldCallBack
    })

    mui.newTextField({
      parent = sceneGroup,
      labelText = "Data Nascimento",
      name = "dataNasc",      
      font = native.systemFont,
      width = 200,
      height = 24,
      x = display.contentCenterX,
      y = 82+(30*4),
      trimAtLength = 5,
      activeColor = { 0, 1, 1, 1 },
      inactiveColor = { 0.5, 0.5, 0.5, 1 },
      callBack = mui.textfieldCallBack
    })

    local listaSelect = listaSelect()
    mui.newSelect({
        name = "posto",
        labelText = "Posto",
        text = "Selecione seu posto",
        font = native.systemFont,
        textColor = { 0 },
        fieldBackgroundColor = { 0.096,0.096,0.096 },
        rowColor = { default={ 1, 1, 1, 1 }, over={ 1, 0.5, 0, 0.2 } }, -- default is the highlighting
        rowBackgroundColor = { 1, 1, 1, 1 }, -- the drop down color of each row
        touchpointColor = { 0.4, 0.4, 0.4 }, -- the touchpoint color
        activeColor = { 0, 1, 1, 1 },
        inactiveColor = { 0.5, 0.5, 0.5, 1 },
        strokeColor = { 0.4, 0.4, 0.4, 1 },
        strokeWidth = 2,
        width = 200,
        height = 30,
        listHeight = 30 * 5,
        x = display.contentCenterX,
        y = 82+(30*10),
        callBackTouch = mui.onRowTouchSelector,
        scrollListener = nil,
        list = listaSelect,
        scrollView = scrollView,
    })

    mui.getTextFieldProperty("nome", "label").x = display.getContentCenterX
    mui.getTextFieldProperty("cartao", "label").x = display.getContentCenterX
    mui.getTextFieldProperty("dataNasc", "label").x = display.getContentCenterX
    mui.getTextFieldProperty("posto", "label").x = display.getContentCenterX
    mui.getTextFieldProperty("posto", "label").size = 14
    
    mui.newRectButton({
        parent = sceneGroup,
        name = "voltar",
        text = "Voltar",
        width = 100,
        height = 30,
        x = display.contentCenterX-60,
        y = 450,
        font = native.systemFont,
        fontSize = 16,
        fillColor = { 0.25, 0.75, 1, 1 },
        textColor = { 1, 1, 1 },
        touchpoint = true,
        callBack = mui.actionSwitchScene,
        callBackData = {
            sceneDestination = "scenes.Login",
            sceneTransitionColor = { 0.73, 0.73, 1 },
            sceneTransitionAnimation = false
        }             
    })

    mui.newRectButton({
        parent = sceneGroup,
        name = "cadastrar",
        text = "Cadastrar",
        width = 100,
        height = 30,
        x = display.contentCenterX+60,
        y = 450,
        font = native.systemFont,
        fontSize = 16,
        fillColor = { 0.25, 0.75, 1, 1 },
        textColor = { 1, 1, 1 },
        touchpoint = true,
        callBack = salvar         
    })

    mui.getRoundedRectButtonProperty("cadastrar", "text").x = display.getContentCenterX
    mui.getRoundedRectButtonProperty("voltar", "text").x = display.getContentCenterX
 
    elseif ( phase == "did" ) then
             
    end
end

function scene:destroy( event )
 
    local sceneGroup = self.view
    
    sceneGroup:removeSelf()
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