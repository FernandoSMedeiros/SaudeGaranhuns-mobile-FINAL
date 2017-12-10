local e = require("model.enumerations.Especialidade")
local p = require("model.enumerations.Prioridade")
local s = require("model.enumerations.Status")

local especialidade = e:criar()
local prioridade = p:criar()
local status = s:criar()

local Consulta = {especialidade, prioridade, status, dataSolicitacao, dataAgendamento, paciente}

function Consulta:criar()
	self.especialidade = "GERAL"
	self.prioridade = "NENHUMA"
	self.status = "FILA"
	self.dataSolicitacao = os.date()
	self.dataAgendamento = "aaaa-mm-dd"
	self.paciente = nil

	return self
end

function Consulta:toJson()
	return "{" .. '"especialidade" : ' .. '"' .. especialidade:valor(self.especialidade) .. '"' .. ","
			   .. '"prioridade" : '.. '"' .. prioridade:valor(self.prioridade) .. '"' .. ","
			   .. '"status" : ' .. '"' .. status:valor(self.status) .. '"' .."," 
			   .. '"dataSolicitacao" : '.. '"' .. self.dataSolicitacao .. '"' .."," 
			   .. '"dataAgendamento" : '.. '"' .. self.dataAgendamento  .. '"' ..","
			   .. '"paciente" : '.. self.paciente:toJson() 
			.."}"
end

return Consulta