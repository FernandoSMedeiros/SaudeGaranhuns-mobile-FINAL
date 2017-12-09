-- Consulta possui: - observação - prioridade:enum (gestante, idoso, bebe de colo, deficiente físico, grávida)
-- status: (pendente, marcado, consultado, cancelado) - data - especialidade:enum (dentista, outros).

  
--[[    
    private Especialidade especialidade;
    private Prioridade prioridade;
    private Status status;
    private LocalDate dataSolicitacao;
    private LocalDate dataAgendamento;    
    private Paciente paciente;
--]]

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
			   .. '"dataAgendamento" : '.. '"' .. self.dataAgendamento  .. '"' .. 
			"}"
end

return Consulta