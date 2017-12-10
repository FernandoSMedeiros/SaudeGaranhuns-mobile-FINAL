local e = require("model.entidades.Endereco")

local Posto = {nome, endereco}

function Posto:criar()
	self.nome = "default"
	self.endereco = e:criar()
	return self
end

function Posto:toJson()
	return "{" .. '"nome":'.. '"' .. self.nome .. '",'
               .. '"endereco":' .. self.endereco:toJson()               
               .. "}"
end

return Posto