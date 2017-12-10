local composer = require( "composer" )
local widget = require( "widget" )

local mui = require( "materialui.mui" )
local muiData = require( "materialui.mui-data" )
 
local scene = composer.newScene()
 
consulta = {observacao = "", prioridade = "Nenhuma", especialidade = "Dentista", status, data}

function definirAnchorXeY (tabela)
  tabela.anchorX = 0
  tabela.anchorY = 0
end
 
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    mui.init()
 
end
  
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

        local cor = {0.26, 0.55, 0.79}
        local corDados = {0.26, 0.55, 0.59}
        local alturaDaTela = display.contentHeight
        local larguraDaTela = display.contentWidth

        retanguloMenu = display.newRect( 0, 0, larguraDaTela, 42 )
        definirAnchorXeY(retanguloMenu)
        retanguloMenu:setFillColor(unpack(cor))
        sceneGroup:insert(retanguloMenu)

        textoMenu = display.newText({
          text = "Detalhes da consulta",
          width = 171,
          height = 18,
          x = 68,
          y = 13,
          fontSize = 14
        })
        definirAnchorXeY(textoMenu)
        sceneGroup:insert(textoMenu)

        retanguloObservacao = display.newRect(63, 71, 187, 27)
        definirAnchorXeY(retanguloObservacao)
        retanguloObservacao:setFillColor(unpack(cor))
        sceneGroup:insert(retanguloObservacao)

        textoObservacao = display.newText({
          text = "Observação",
          x = 71,
          y = 76,
          width = 99,
          height = 21,
          fontSize = 14
        })
        definirAnchorXeY(textoObservacao)
        sceneGroup:insert(textoObservacao)

        local scrollView = widget.newScrollView({
          x = 63,
          y = 96,
          width = 187,
          height = 96,
          horizontalScrollDisabled = true,
          scrollHeight = 0,
          backgroundColor = corDados,
          listener = scrollListener
        })
        definirAnchorXeY(scrollView)

        textoObservacaoDados = display.newText({
          text = "Aqui vai a observaçãoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo0000000000000000000000000000000",
          x = 5,
          y = 0,
          width = 180,
          height = 1000,
          fontSize = 14
        })
        definirAnchorXeY(textoObservacaoDados)
        sceneGroup:insert(textoObservacaoDados)
        scrollView:insert(textoObservacaoDados)

        retanguloPrioridade = display.newRect(63, 207, 187, 27)
        definirAnchorXeY(retanguloPrioridade)
        retanguloPrioridade:setFillColor(unpack(cor))
        sceneGroup:insert(retanguloPrioridade)

        textoPrioridade = display.newText({
          text = "Prioridade",
          x = 71,
          y = 210,
          width = 99,
          height = 21,
          fontSize = 14
        })
        definirAnchorXeY(textoPrioridade)
        sceneGroup:insert(textoPrioridade)

        retanguloPrioridadeDados = display.newRect(63, 232, 187, 27)
        definirAnchorXeY(retanguloPrioridadeDados)
        retanguloPrioridadeDados:setFillColor(unpack(corDados))
        sceneGroup:insert(retanguloPrioridadeDados)

        textoPrioridadeDados = display.newText({
          text = "PrioridadeDados",
          x = 71,
          y = 236,
          width = 182,
          height = 21,
          fontSize = 14
        })
        definirAnchorXeY(textoPrioridadeDados)
        sceneGroup:insert(textoPrioridadeDados)

        retanguloEspecialidade = display.newRect(63, 272, 187, 27)
        definirAnchorXeY(retanguloEspecialidade)
        retanguloEspecialidade:setFillColor(unpack(cor))
        sceneGroup:insert(retanguloEspecialidade)

        textoEspecialidade = display.newText({
          text = "Especialidade",
          x = 71,
          y = 275,
          width = 182,
          height = 21,
          fontSize = 14
        })
        definirAnchorXeY(textoEspecialidade)
        sceneGroup:insert(textoEspecialidade)

        retanguloEspecialidadeDados = display.newRect(63, 298, 187, 27)
        definirAnchorXeY(retanguloEspecialidadeDados)
        retanguloEspecialidadeDados:setFillColor(unpack(corDados))
        sceneGroup:insert(retanguloEspecialidadeDados)

        textoEspecialidadeDados = display.newText({
          text = "EspecialidadeDados",
          x = 71,
          y = 302,
          width = 182,
          height = 21,
          fontSize = 14
        })
        definirAnchorXeY(textoEspecialidadeDados)
        sceneGroup:insert(textoEspecialidadeDados)

        retanguloStatus = display.newRect(63, 339, 187, 27)
        definirAnchorXeY(retanguloStatus)
        retanguloStatus:setFillColor(unpack(cor))
        sceneGroup:insert(retanguloStatus)

        textoStatus = display.newText({
          text = "Status",
          x = 71,
          y = 344,
          width = 182,
          height = 21,
          fontSize = 14
        })
        definirAnchorXeY(textoStatus)
        sceneGroup:insert(textoStatus)

        retanguloStatusDados = display.newRect(63, 364, 187, 27)
        definirAnchorXeY(retanguloStatusDados)
        retanguloStatusDados:setFillColor(unpack(corDados))
        sceneGroup:insert(retanguloStatusDados)

        textoStatusDados = display.newText({
          text = "StatusDados",
          x = 71,
          y = 369,
          width = 182,
          height = 21,
          fontSize = 14
        })
        definirAnchorXeY(textoStatusDados)
        sceneGroup:insert(textoStatusDados)

        retanguloData = display.newRect(63, 405, 187, 27)
        definirAnchorXeY(retanguloData)
        retanguloData:setFillColor(unpack(cor))
        sceneGroup:insert(retanguloData)

        textoData = display.newText({
          text = "Data",
          x = 71,
          y = 410,
          width = 182,
          height = 21,
          fontSize = 14
        })
        definirAnchorXeY(textoData)
        sceneGroup:insert(textoData)

        retanguloDataDados = display.newRect(63, 430, 187, 27)
        definirAnchorXeY(retanguloDataDados)
        retanguloDataDados:setFillColor(unpack(corDados))
        sceneGroup:insert(retanguloDataDados)

        textoDataDados = display.newText({
          text = "DataDados",
          x = 71,
          y = 435,
          width = 182,
          height = 21,
          fontSize = 14
        })
        definirAnchorXeY(textoDataDados)
        sceneGroup:insert(textoDataDados)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
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