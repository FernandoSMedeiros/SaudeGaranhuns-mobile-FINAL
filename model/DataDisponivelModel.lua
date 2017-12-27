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

function DataDisponivel:buscar()	
	r = http.request("http://192.168.0.105:8080/agendamentos?id=" .. id .. "&enum=" .. enum)
	return json.decode(r)
end	

return DataDisponivel