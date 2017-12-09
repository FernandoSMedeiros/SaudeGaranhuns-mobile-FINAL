local Endereco = {logradouro, numero, bairro}

function Endereco:criar(logradouro, numero, bairro)
	self.logradouro = logradouro
	self.numero = numero
	self.bairro = bairro
	return self
end

function Endereco:toJson()
	return "{" .. '"logradouro":'.. '"' .. self.logradouro .. '",'
               .. '"numero":' .. '"' .. self.numero .. '",'               
               .. '"bairro":' .. self.bairro:toJson()               
               .. "}"
end

return Endereco