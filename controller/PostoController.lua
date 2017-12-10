local model = request("model.PostoModel")
local posto = request("model.entidades.Posto")

local PostoController = {model, posto}

function PostoController:criar()
	self.model = model:criar()
	self.posto = posto:criar()
	return self
end	

function PostoController:buscar()
	self.model:buscar()
end