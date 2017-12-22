local b = require("model.entidades.Bairro")

local Endereco = {id, logradouro, numero, bairro}

function Endereco:criar()
	self.id = 0
	self.logradouro = "default"
	self.numero = 0
	self.bairro = b:criar()
	return self
end

function Endereco:toJson()
	return "{" .. '"id":'.. self.id .. ','
			   .. '"logradouro":'.. '"' .. self.logradouro .. '",'
               .. '"numero":' .. '"' .. self.numero .. '",'               
               .. '"bairro":' .. self.bairro:toJson()               
               .. "}"
end

return Endereco