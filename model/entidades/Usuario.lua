local Usuario = {id, login, senha, perfilUsuario}

function Usuario:criar()
	self.id = 0
	self.login = 00000
	self.senha = 00000
	self.perfilUsuario = "PACIENTE"
	return self
end

function Usuario:toJson()
	 return "{" .. '"id ":'.. '"' .. self.id .. '",'
	 			.. '"login ":'.. '"' .. self.login .. '",'
               	.. '"senha":' .. '"' .. self.senha .. '",'
               	.. '"perfilUsuario":' .. '"' .. self.perfilUsuario .. '"'
               	..'}'
end

return Usuario