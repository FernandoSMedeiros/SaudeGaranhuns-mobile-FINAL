local Bairro = {id, nome}

function Bairro:criar()
	self.id = 0
	self.nome = "default"
	return self
end

function Bairro:toJson()
	return "{" .. '"id":'.. '"' .. self.id .. '",'
			   .. '"nome":' .. '"' .. self.nome ..'"' 
			.. "}"
end

return Bairro