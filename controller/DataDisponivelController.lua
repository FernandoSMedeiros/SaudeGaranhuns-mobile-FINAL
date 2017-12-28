local model = require("model.DataDisponivelModel")

local DataDisponivelController = {model}

function DataDisponivelController:criar()
	local controller = {}
	self = setmetatable(controller, {__index = DataDisponivelController})
	self.model = model:criar()	
	return self
end

function DataDisponivelController:buscar(id, enum)
	return self.model:buscar(id, enum)		
end

return DataDisponivelController