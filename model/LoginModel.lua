local composer = require("composer")
local usuario = require("model.entidades.Usuario")
local json = require("json")

local LoginModel = {usuario}

function LoginModel:criar()	
	self.usuario = usuario:criar()
	return self
end

function LoginModel:logar()
	print("chegou no logar do model")
	--print(self.usuario.usuario)
	network.request("http://192.168.0.105:8080/pacientes?cartaoSus=" .. self.usuario.login, "GET", busca)		
end

function busca (event)
	if ( event.isError ) then
        
        print( "Network error: ", event.response )
        
    else
        
        print(event.status)

        --[[local response = event.response
        local usuario = LoginModel.usuario.login           
        
        local resultado = json.decode(event.response)
        
        print(resultado.cartaoSus)
        
        if (usuario == resultado.cartaoSus) then
            composer.gotoScene("view.MenuPrincipal")
        end --]]     
        
    end
end

return LoginModel