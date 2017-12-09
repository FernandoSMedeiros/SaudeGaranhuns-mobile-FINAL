local Consulta = {especialidade, prioridade, status, dataSolicitacao, dataAgendamento, paciente}

function Consulta:criar(especialidade, prioridade, status, dataSolicitacao, dataAgendamento, paciente)
	self.especialidade = especialidade
	self.prioridade = prioridade
	self.status = status
	self.dataSolicitacao = dataSolicitacao
	self.dataAgendamento = dataAgendamento
	self.paciente = paciente

	return self
end

function Consulta:toJson()
	return "{" .. '"especialidade" : ' .. '"' .. self.especialidade .. '"' .. ","
			   .. '"prioridade" : '.. '"' .. self.prioridade .. '"' .. ","
			   .. '"status" : ' .. '"' .. self.status .. '"' .."," 
			   .. '"dataSolicitacao" : '.. '"' .. self.dataSolicitacao .. '"' .."," 
			   .. '"dataAgendamento" : '.. '"' .. self.dataAgendamento  .. '"' ..","
			   .. '"paciente" : '.. self.dataAgendamento:toJson() 
			.."}"
end

return Consulta