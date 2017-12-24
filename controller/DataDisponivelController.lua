local model = require("model.DataDisponivelModel")

local DataDisponivelController = {model}

function DataDisponivelController:criar()
	local controller = {}
	self = setmetatable(controller, {__index = DataDisponivelController})
	self.model = model:criar()	
	return self
end

function DataDisponivelController:buscar()
	return self.model:buscar()		
end

return DataDisponivelController