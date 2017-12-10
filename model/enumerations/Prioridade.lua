-- gestante, idoso, bebe de colo, deficiente físico

local Prioridade = {NENHUMA = {0, "Nehuma"}, GESTANTE = {1, "Gestante"}, 
					IDOSO = {2, "Idoso"}, BEBEDECOLO = {3, "Bebe de colo"}, 
					DEFICIENTE = {4, "Deficiente Fisico"}}

function Prioridade:criar()
	return self
end

function Prioridade:valor(prioridade)
	return self[prioridade][1]
end

function Prioridade:nome(prioridade)
	if prioridade == 0 then
		return self["NENHUMA"][2]
	elseif prioridade == 1 then
		return self["GESTANTE"][2]
	elseif prioridade == 2 then
		return self["IDOSO"][2]
	elseif prioridade == 3 then
		return self["BEBEDECOLO"][2]
	elseif prioridade == 4 then
		return self["DEFICIENTE"][2]
	end
end

return Prioridade