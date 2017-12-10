local Bairro = {nome}

function Bairro:criar()
	self.nome = "default"
	return self
end

function Bairro:toJson()
	return "{" .. '"nome":' .. '"' .. self.nome ..'"' .. "}"
end

return Bairro