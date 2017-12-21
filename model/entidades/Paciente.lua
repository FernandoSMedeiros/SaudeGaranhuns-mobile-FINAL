local p = require("model.entidades.Posto")
local data = require("model.entidades.DataNascimento")
local user = require("model.entidades.Usuario")

local Paciente = {id, nome, cartaoSus, dataNasc, posto, usuario}

function Paciente:criar()
	self.id = 0
	self.nome = "default"
	self.cartaoSus = 0
	self.dataNasc = data:criar() 
	self.posto = p:criar()
	self.usuario = user:criar()

	return self
end

function Paciente:toJson()
    return "{" .. '"id":'.. '"' .. self.id .. '",'
    		   .. '"nome":'.. '"' .. self.nome .. '",'
               .. '"cartaoSus":' .. '"'.. self.cartaoSus .. '",'
               .. '"dataNascimento":' .. self.dataNasc:toJson() .. ','
               .. '"postoSaude":' .. self.posto:toJson().. ','
               .. '"usuario":' .. self.usuario:toJson()
               .. '}'
end

return Paciente