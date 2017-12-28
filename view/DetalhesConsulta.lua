local composer = require( "composer" )
local widget = require( "widget" )

local mui = require( "materialui.mui" )
local muiData = require( "materialui.mui-data" )
 
local scene = composer.newScene()
 


function scene:create( event )
 
    local sceneGroup = self.view
    
    mui.init()

    detalhe = composer.getVariable("detalhe")
 
end
  
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
     
    local centerX = display.contentCenterX
    local centerY = display.contentCenterY

    local cor = {0, 0, 0}

     mui.newText({
      parent = sceneGroup,
      y = 16,
      x = centerX - 100,
      name = "solicitacao",
      text = "Data Solicitação",
      align = "center",
      width = 140,
      font = native.systemFontBold,
      fontSize = 12,
      fillColor = cor,
      })

      mui.newText({
      parent = sceneGroup,
      y = 40,
      x = centerX - 85,
      name = "dataSolicitacao",
      text = detalhe.dataSolicitacao.day .. '/' .. detalhe.dataSolicitacao.month .. '/' .. detalhe.dataSolicitacao.year,
      align = "center",
      width = 150,
      font = native.systemFont,
      fontSize = 25,
      fillColor = cor,
      })
-- --------------------------------------
     mui.newText({
      parent = sceneGroup,
      y = 16,
      x = centerX + 34,
      name = "status",
      text = "Status",
      align = "center",
      width = 140,
      font = native.systemFontBold,
      fontSize = 12,
      fillColor = cor,
      })     

      mui.newText({
      parent = sceneGroup,
      y = 40,
      x = 232,
      name = "statusAtual",
      text = detalhe.status,
      align = "center",
      width = 150,
      font = native.systemFont,
      fontSize = 25,
      fillColor = cor,
      })

-- ----------------------------------------     
 
 mui.newText({
      parent = sceneGroup,
      y = 80,
      x = centerX - 120,
      name = "paciente",
      text = "paciente",
      --align = "center",
      width = 50,
      font = native.systemFontBold,
      fontSize = 12,
      fillColor = cor,
      })     

      mui.newText({
      parent = sceneGroup,
      y = 104,
      x = centerX + 23,
      name = "nome",
      text = detalhe.paciente.nome,
      width = 340,
      font = native.systemFont,
      fontSize = 25,
      fillColor = cor,
      })
-- ----------------------------------------------

 mui.newText({
      parent = sceneGroup,
      y = 150,
      x = centerX - 95,
      name = "especialidade",
      text = "Especialidade",
      --align = "center",
      width = 100,
      font = native.systemFontBold,
      fontSize = 12,
      fillColor = cor,
      })     

      mui.newText({
      parent = sceneGroup,
      y = 173,
      x = centerX - 70,
      name = "nomeEspecialidade",
      text = detalhe.especialidade,
      width = 150,
      font = native.systemFont,
      fontSize = 25,
      fillColor = cor,
      })

-- ----------------------------------------------

 mui.newText({
      parent = sceneGroup,
      y = 150,
      x = centerX + 65,
      name = "consulta",
      text = "Data da Consulta",
      --align = "center",
      width = 100,
      font = native.systemFontBold,
      fontSize = 12,
      fillColor = cor,
      })     

 mui.newText({
      parent = sceneGroup,
      y = 173,
      x = centerX + 85,
      name = "dataConsulta",
      text = detalhe.dataAgendamento.day .. '/' .. detalhe.dataAgendamento.month .. '/' .. detalhe.dataAgendamento.year,
      width = 150,
      font = native.systemFont,
      fontSize = 25,
      fillColor = cor,
      })
-- --------------------------------------------
mui.newText({
      parent = sceneGroup,
      y = 240,
      x = centerX - 90,
      name = "posto",
      text = "Posto",
      --align = "center",
      width = 100,
      font = native.systemFontBold,
      fontSize = 12,
      fillColor = cor,
      })     

 mui.newText({
      parent = sceneGroup,
      y = 260,
      x = centerX + 20,
      name = "nomePosto",
      text = detalhe.paciente.postoSaude.nome,
      width = 320,
      font = native.systemFont,
      fontSize = 25,
      fillColor = cor,
      })

  mui.newText({
      parent = sceneGroup,
      y = 295,
      x = centerX +20,
      name = "enderecoPosto",
      text = detalhe.paciente.postoSaude.endereco.logradouro .. ", " .. detalhe.paciente.postoSaude.endereco.numero 
             .. ", \nBairro: " .. detalhe.paciente.postoSaude.endereco.bairro.nome,
      width = 320,
      font = native.systemFont,
      fontSize = 20,
      fillColor = cor,
      })

-- -------------------------------------------------

  mui.newRectButton({
        parent = sceneGroup,
        name = "voltarParaListaConsultas",
        text = "Voltar",
        width = 150,
        height = 40,
        x = display.getContentCenterX,
        y = display.contentCenterY+200,
        font = native.systemFont,
        fontSize = 16,
        fillColor = { 0.25, 0.75, 1, 1 },
        textColor = { 1, 1, 1 },
        touchpoint = true,        
        callBack = mui.actionSwitchScene,
        callBackData = {
            sceneDestination = "view.ListagemConsultas",
            sceneTransitionColor = { 0.73, 0.73, 1 },
            sceneTransitionAnimation = false
        }   
    })  

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
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