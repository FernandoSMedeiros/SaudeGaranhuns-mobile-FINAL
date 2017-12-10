local model = request("model.PacienteModel")
local paciente = request("model.entidades.Paciente")

local PacienteController = {model, paciente}

function PacienteController:salvar()
	self.model = model:criar()
	self.paciente = paciente:criar()
end

function PacienteController:salvar()
	self.model:salvar(self.paciente)		
end

function PacienteController:atualizar()
	self.model:salvar(self.paciente)
end

return PacienteController