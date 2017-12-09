local Bairro = {nome}

function Bairro:criar(nome)
	self.nome = nome
	return self
end

function Bairro:toJson()
	return "{" .. '"nome":' .. '"' .. self.nome ..'"' .. "}"
end

return Bairro