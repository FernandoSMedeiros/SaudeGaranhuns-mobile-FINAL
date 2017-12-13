local Usuario = {usuario, senha}

function Usuario:criar()
	self.usuario = 00000
	self.senha = 00000
	return self
end

function Usuario:toJson()
	 return "{" .. '"usuario ":'.. '"' .. self.nome .. '",'
               	.. '"senha":' .. '"' .. self.senha .. '"'
               	.."}"
end

return Usuario