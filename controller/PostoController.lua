local model = require("model.PostoModel")
local posto = require("model.entidades.Posto")

local PostoController = {model, posto}

function PostoController:criar()
	self.model = model:criar()
	self.posto = posto:criar()
	return self
end	

function PostoController:buscar()
	self.model:buscar()
end

return PostoController