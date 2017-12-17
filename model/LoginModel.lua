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
	network.request("http://viacep.com.br/ws/01001000/json/", "GET", busca)		
end

function busca (event)
	if ( event.isError ) then
        print( "Network error: ", event.response )
        
    else
    	
        local usuario = LoginModel.usuario.usuario        
        local resultado = json.decode(event.response)
        print(resultado.cep)
        if (usuario == resultado.cep) then
            composer.gotoScene("view.MenuPrincipal")
        end 

    	print(event.response)
		
    end
end

return LoginModel