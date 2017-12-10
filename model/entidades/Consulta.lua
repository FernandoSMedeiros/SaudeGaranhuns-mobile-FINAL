local especialidade = require("model.enumerations.Especialidade")
local prioridade = require("model.enumerations.Prioridade")
local status = require("model.enumerations.Status")

local paciente = require("model.")

local Consulta = {especialidade, prioridade, status, dataSolicitacao, dataAgendamento, paciente}

function Consulta:criar()
	self.especialidade = 0
	self.prioridade = 0
	self.status = 0
	self.dataSolicitacao = "aaaa-mm-dd"
	self.dataAgendamento = "aaaa-mm-dd"
	self.paciente = nil

	return self
end

function Consulta:toJson()
	return "{" .. '"especialidade" : ' .. '"' .. especialidade:valor(self.especialidade) .. '"' .. ","
			   .. '"prioridade" : '.. '"' .. prioridade:valor(self.prioridade) .. '"' .. ","
			   .. '"status" : ' .. '"' .. status:(self.status) .. '"' .."," 
			   .. '"dataSolicitacao" : '.. '"' .. self.dataSolicitacao .. '"' .."," 
			   .. '"dataAgendamento" : '.. '"' .. self.dataAgendamento  .. '"' ..","
			   .. '"paciente" : '.. self.paciente:toJson() 
			.."}"
end

return Consulta