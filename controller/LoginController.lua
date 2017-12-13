local model = require("model.LoginModel")
local usuario = require("model.entidades.Usuario")

local LoginController = {model}

function LoginController:criar()
	self.model = model:criar()	
	return self
end

function LoginController:logar()
	self.model:logar(self.model)		
end

return LoginController