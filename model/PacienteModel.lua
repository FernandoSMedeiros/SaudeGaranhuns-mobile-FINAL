local json = require("json")

local PacienteModel = {paciente}

function PacienteModel:criar(paciente)
	self.paciente = paciente
	return self
end

function PacienteModel:salvar()
	
		local headers = {}
		local body = self.paciente:toJson()
		local params = {}
  
		headers["Content-Type"] = "application/json; charset=utf-8" 
		params.headers = headers
		params.body = body

		print(body)

		network.request( "http://192.168.0.105:8084/CadastroCliente/rest/clientes/", "POST", networkListener, params)
	
end

function PacienteModel:atualizar()
	
		local headers = {}
		local body = self.paciente:toJson()
		local params = {}
  
		headers["Content-Type"] = "application/json; charset=utf-8" 
		params.headers = headers
		params.body = body		

		network.request( "http://192.168.0.105:8084/CadastroCliente/rest/clientes/", "PUT", networkListener, params)
	
end

function networkListener(event) 
    if ( event.isError ) then
        print( "Network error: ", event.response )
    else
        print ( "RESPONSE: " .. event.response )
    end
end

return PacienteModel