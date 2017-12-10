local composer = require( "composer" )
local json = require("json")
local c = require("model.entidades.Consulta")

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
		
		network.request( "http://192.168.0.105:8084/CadastroCliente/rest/clientes/", "POST", networkListener, params)
	
end

function ConsultaModel:atualizar()
	
		local headers = {}
		local body = self.consulta:toJson()
		local params = {}
  
		headers["Content-Type"] = "application/json; charset=utf-8" 
		params.headers = headers
		params.body = body		

		print(body)

		network.request( "http://192.168.0.105:8084/CadastroCliente/rest/clientes/", "PUT", networkListener, params)
	
end

function ConsultaModel:buscar()
		 
	local data

	network.request("http://viacep.com.br/ws/01001000/json/", "GET", busca)
		
end

function busca (event)
	if ( event.isError ) then
        print( "Network error: ", event.response )
    else
    	local consultas = json.decode(event.response)
    end
end

function networkListener(event) 
    if ( event.isError ) then
        print( "Network error: ", event.response )
    else
        print ( "RESPONSE: " .. event.response )
    end
end



return ConsultaModel