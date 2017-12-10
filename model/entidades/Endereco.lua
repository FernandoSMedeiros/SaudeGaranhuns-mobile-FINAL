local b = require("model.entidades.Bairro")

local Endereco = {logradouro, numero, bairro}

function Endereco:criar()
	self.logradouro = "default"
	self.numero = 0
	self.bairro = b:criar()
	return self
end

function Endereco:toJson()
	return "{" .. '"logradouro":'.. '"' .. self.logradouro .. '",'
               .. '"numero":' .. '"' .. self.numero .. '",'               
               .. '"bairro":' .. self.bairro:toJson()               
               .. "}"
end

return Endereco