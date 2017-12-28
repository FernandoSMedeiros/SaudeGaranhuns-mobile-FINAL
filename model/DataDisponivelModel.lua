local json = require("json")

local io = require("io")
local http = require("socket.http")
--local ltn12 = require("ltn12")

local DataDisponivel = {month, day, year}

datas = nil

function DataDisponivel:criar()
	local data = {}
	data = setmetatable(data, {__index = DataDisponivel})
	return data
end

function DataDisponivel:buscar(id, enum)	
	
	print("URL: " .. "http://10.28.3.143:8080/agendamentos?id=" .. id .. "&enum=" .. enum)
	
	r = http.request("http://10.28.3.143:8080/agendamentos?id=" .. id .. "&enum=" .. enum)	
	return json.decode(r)
	
end	

function onComplete( event )
    if ( event.action == "clicked" ) then
        local i = event.index
        if ( i == 1 ) then
           voltar()
        end
    end
end

function voltar()
	composer.gotoScene("view.MenuPrincipal")
end

return DataDisponivel