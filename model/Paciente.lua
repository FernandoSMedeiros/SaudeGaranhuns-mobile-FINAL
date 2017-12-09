local Paciente = {nome, cartaoSus, dataNasc, posto}

function Paciente:criar(nome, cartaoSus, dataNasc, posto)
	self.nome = nome
	self.cartaoSus = cartaoSus
	self.dataNasc = dataNasc
	self.posto = posto

	return self
end

function Paciente:toJson()
    return "{" .. '"nome ":'.. '"' .. self.nome .. '",'
               .. '"cartaoSus":' .. '"' .. self.cartaoSus .. '",'
               .. '"dataNasc":' .. '"' .. self.dataNasc .. '",'
               .. '"posto":' .. self.posto:toJson()
               .. "}"
end

return Paciente