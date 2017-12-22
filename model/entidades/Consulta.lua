local e = require("model.enumerations.Especialidade")
local p = require("model.enumerations.Prioridade")
local s = require("model.enumerations.Status")
local dataSol = require("model.entidades.DataSolicitacao")
local dataAg = require("model.entidades.DataAgendamento")

local especialidade = e:criar()
local prioridade = p:criar()
local status = s:criar()

local Consulta = {especialidade, prioridade, status, dataSolicitacao, dataAgendamento, paciente}

function Consulta:criar()
	self.especialidade = "GERAL"
	self.prioridade = "NENHUMA"
	self.status = "FILA"
	self.dataSolicitacao = dataSol:criar()
	self.dataAgendamento = dataAg:criar()
	self.paciente = paciente

	return self
end

function Consulta:toJson()
	return '[' .. "{" .. '"especialidade":' .. especialidade:valor(self.especialidade) .. ","
			   .. '"prioridade":'.. prioridade:valor(self.prioridade) .. ","
			   .. '"status":' .. status:valor(self.status) .."," 
			   .. '"dataSolicitacao":'.. self.dataSolicitacao:toJson() .."," 
			   .. '"dataAgendamento":'.. self.dataAgendamento:toJson()  ..","
			   .. '"paciente":'.. self.paciente 
			.."}" .. ']'
end

return Consulta