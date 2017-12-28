local e = require("model.enumerations.Especialidade")
local p = require("model.enumerations.Prioridade")
local s = require("model.enumerations.Status")
local dataSol = require("model.entidades.DataSolicitacao")
local dataAg = require("model.entidades.DataAgendamento")

local especialidade = e:criar()
local prioridade = p:criar()
local status = s:criar()

local Consulta = {id, especialidade, prioridade, status, dataSolicitacao, dataAgendamento, paciente}

function Consulta:criar()
	self.id = 0
	self.especialidade = "GERAL"
	self.prioridade = "NENHUMA"
	self.status = "AGENDADO"
	self.dataSolicitacao = dataSol:criar()
	self.dataAgendamento = dataAg:criar()
	self.paciente = paciente

	return self
end

function Consulta:toJson()
	return "{" .. '"id":' .. self.id .. ","
			   .. '"especialidade":' .. '"' .. self.especialidade .. '"' .. ","
			   .. '"prioridade":'.. '"' .. self.prioridade .. '"' .. ","
			   .. '"status":' .. '"' .. self.status .. '"' .. "," 
			   .. '"dataSolicitacao":'.. self.dataSolicitacao:toJson() .."," 
			   .. '"dataAgendamento":'.. self.dataAgendamento:toJson()  ..","
			   .. '"paciente":'.. self.paciente 
			.."}"
end

return Consulta