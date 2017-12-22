local e = require("model.entidades.Endereco")

local Posto = {id, nome, endereco}

function Posto:criar()
	self.id = 0
	self.nome = "default"
	self.endereco = e:criar()
	return self
end

function Posto:toJson()
	return "{" .. '"id":'.. self.id .. ','
			   .. '"nome":'.. '"' .. self.nome .. '",'
               .. '"endereco":' .. self.endereco:toJson()               
               .. "}"
end

return Posto