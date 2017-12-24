local composer = require( "composer" )
local json = require("json")
local c = require("model.entidades.Consulta")

local io = require("io")
local http = require("socket.http")
--local ltn12 = require("ltn12")

local ConsultaModel = {consulta}

function ConsultaModel:criar()
	self.consulta = c:criar()
	return self
end

function ConsultaModel:salvar()
	
		local headers = {}
		local body = self.consulta:toJson()
		local params = {}
  
		headers["Content-Type"] = "application/json; charset=utf-8" 
		params.headers = headers
		params.body = body

		print(body)
		
		network.request( "http://192.168.0.105:8080/consultas", "POST", networkListener, params)
	
end

function ConsultaModel:atualizar()
	
		local headers = {}
		local body = self.consulta:toJson()
		local params = {}
  
		headers["Content-Type"] = "application/json; charset=utf-8" 
		params.headers = headers
		params.body = body		
		network.request( "http://192.168.0.105:8084/CadastroCliente/rest/clientes/", "PUT", networkListener, params)
	
end

function ConsultaModel:buscar(id)
	print(id)
	r, c = http.request("http://192.168.0.105:8080/consultas/?id=" .. id)
	
	if r == nil then
		print("Erro ao recuperar consulta: " .. c)
	else	
		return json.decode(r)
	end	
	
end

function networkListener(event) 
    if ( event.isError ) then
        print( "Status: ", event.status )
    else
        print ( "Status: " .. event.status )
    end
end



return ConsultaModel