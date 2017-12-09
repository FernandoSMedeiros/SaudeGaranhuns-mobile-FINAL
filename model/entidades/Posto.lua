local Posto = {nome, endereco}

function Posto:criar(nome, endereco)
	self.nome = nome
	self.endereco = endereco
	return self
end

function Posto:toJson()
	return "{" .. '"nome":'.. '"' .. self.nome .. '",'
               .. '"endereco":' .. self.endereco:toJson()               
               .. "}"
end

return Posto