local model = require("model.ConsultaModel")
local consulta = require("model.entidades.Consulta")

local ConsultaController = {model, consulta}

function ConsultaController:criar()
	self.model = model:criar()
	self.consulta = consulta:criar()
	return self 
end

function ConsultaController:salvar()
	self.model:salvar(self.consulta)
end

function ConsultaController:atualizar()
	self.model:atualizar(self.consulta)
end

function ConsultaController:buscar()
	self.model:buscar()
end	

return ConsultaController