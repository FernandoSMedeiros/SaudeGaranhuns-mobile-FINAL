local Especialidade = {GERAL = {0, "Geral"}, DENTISTA = {1, "Dentista"}}

function Especialidade:criar()
	return self
end

function Especialidade:valor(especialidade)
	return self[especialidade][1]
end

function Especialidade:nome(especialidade)
	if especialidade == 0 then
		return self["GERAL"][2]
	elseif especialidade == 1 then
		return self["DENTISTA"][2]	
	end
end

return Especialidade