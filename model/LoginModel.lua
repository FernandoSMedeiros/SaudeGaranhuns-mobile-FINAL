local composer = require("composer")
local usuario = require("model.entidades.Usuario")
local json = require("json")

local LoginModel = {usuario, logado}

usuarioLogado = nil

function LoginModel:criar()	
	self.usuario = usuario:criar()
	return self
end

function LoginModel:logar()
	print("chegou no logar do model")
	print(self.usuario.login)
	network.request("http://192.168.0.105:8080/pacientes?cartaoSus=" .. self.usuario.login, "GET", LoginModel.busca)		
end

function LoginModel.busca (event)    
	if ( event.isError ) then
        print(event.status)
        print( "Network error: ", event.response )
        
    else

        print("Login status: " .. event.status)
        if event.status == 200 then

        local response = event.response
        local usuario = LoginModel.usuario.login           
        
        local resultado = json.decode(event.response)
        
        LoginModel.logado = event.response

        print(event.response)
           
            if (usuario == resultado.cartaoSus) then
                composer.gotoScene("view.MenuPrincipal")                
            end  

        end    
        
    end
end

return LoginModel