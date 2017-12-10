local model = require("model.PacienteModel")
local paciente = require("model.entidades.Paciente")

local PacienteController = {model, paciente}

function PacienteController:criar()
	self.model = model:criar()
	self.paciente = paciente:criar()
	return self
end

function PacienteController:salvar()
	self.model:salvar(self.paciente)		
end

function PacienteController:atualizar()
	self.model:atualizar(self.paciente)
end

return PacienteController