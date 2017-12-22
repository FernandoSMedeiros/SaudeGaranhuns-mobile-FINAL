local composer = require( "composer" )
local widget = require( "widget" )
local mui = require( "materialui.mui" )
local muiData = require( "materialui.mui-data" )
local usuario = require("model.entidades.Usuario")
local login = require("controller.LoginController")
local controller = require("controller.PostoController")

local scene = composer.newScene()

local logar = function()

  login.model.usuario.login = mui.getTextFieldProperty("cart", "value")  
  login:logar()

end

local cadastrar = function()
  composer.gotoScene("view.CadastroPaciente")
end

function scene:create( event )
 
  local sceneGroup = self.view
  login:criar()

end

function scene:show( event )

  local sceneGroup = self.view    
  local phase = event.phase
  
 
  if ( phase == "will" ) then

    mui.init()

    mui.newTextField({
      parent = sceneGroup,
      labelText = "Cartão do SUS",
      name = "cart",      
      font = native.systemFont,
      width = 200,
      height = 24,
      x = display.contentCenterX,
      y = display.contentCenterY-50,
      trimAtLength = 5,
      --fillColor = {0, 0, 0},
      
      activeColor = { 0, 1, 1, 1 },
      inactiveColor = { 0.5, 0.5, 0.5, 1 },
      callBack = mui.textfieldCallBack
    })

    mui.getTextFieldProperty("cart", "label").x = display.getContentCenterX
    
    mui.newRectButton({
        parent = sceneGroup,
        name = "login",
        text = "Login",
        width = 100,
        height = 30,
        x = display.getContentCenterX,
        y = display.contentCenterY,
        font = native.systemFont,
        fontSize = 16,
        fillColor = { 0.25, 0.75, 1, 1 },
        textColor = { 0, 0, 0 },
        touchpoint = true,
        callBack = logar,        
    })

    mui.newRectButton({
        parent = sceneGroup,
        name = "cadastrar",
        text = "Cadastrar",
        width = 100,
        height = 30,
        x = display.getContentCenterX,
        y = display.contentCenterY+50,
        font = native.systemFont,
        fontSize = 16,
        fillColor = { 0.25, 0.75, 1, 1 },
        textColor = { 0, 0, 0 },
        touchpoint = true,
        callBack = mui.actionSwitchScene,
        callBackData = {
            sceneDestination = "view.CadastroPaciente",
            sceneTransitionColor = { 0.73, 0.73, 1 },
            sceneTransitionAnimation = false
        } 
    })

    mui.getRoundedRectButtonProperty("login", "text").x = display.getContentCenterX
    mui.getRoundedRectButtonProperty("cadastrar", "text").x = display.getContentCenterX

    elseif ( phase == "did" ) then
      local posto = controller:criar()
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