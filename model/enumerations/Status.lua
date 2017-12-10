local Status = {FILA = {0, "Fila"}, AGENDADO = {1, "Agendado"}, CANCELADO = {2, "Cancelado"}}

function Status:criar()
	return self
end

function Status:valor(status)
	return self[status][1]
end

function Status:nome(status)
	if status == 0 then
		return self["FILA"][2]
	elseif status == 1 then
		return self["AGENDADO"][2]
	elseif status == 2 then
		return self["CANCELADO"][2]	
	end
end

return Status

