local m = require("model.PostoModel")
local p = require("model.entidades.Posto")

local PostoController = {model, posto}

function PostoController:criar()
	self.model = m:criar()
	self.posto = p:criar()
	return PostoController
end	

function PostoController:buscar()
	self.model:buscar()
end

return PostoController