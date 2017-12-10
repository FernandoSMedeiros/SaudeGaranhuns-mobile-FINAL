local p = require("model.entidades.Posto")

local Paciente = {nome, cartaoSus, dataNasc, posto}

function Paciente:criar()
	self.nome = "default"
	self.cartaoSus = 0
	self.dataNasc = "aaaa-mm-dd"
	self.posto = p:criar() --

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