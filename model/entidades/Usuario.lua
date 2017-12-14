local Usuario = {usuario, senha, perfilUsuario}

function Usuario:criar()
	self.usuario = 00000
	self.senha = 00000
	self.perfilUsuario = "Paciente"
	return self
end

function Usuario:toJson()
	 return "{" .. '"usuario ":'.. '"' .. self.nome .. '",'
               	.. '"senha":' .. '"' .. self.senha .. '"'
               	.."}"
end

return Usuario