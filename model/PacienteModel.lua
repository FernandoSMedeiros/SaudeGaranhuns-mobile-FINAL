local json = require("json")

local PacienteModel = {}

function PacienteModel:criar()
	return self
end

function PacienteModel:salvar(paciente)
	
		local headers = {}
		local body = paciente:toJson()
		local params = {}
  
		headers["Content-Type"] = "application/json; charset=utf-8" 
		params.headers = headers
		params.body = body

		print(body)

		network.request( "http://192.168.56.1:8888/pacientes", "POST", networkListener, params)
	
end

function PacienteModel:atualizar(paciente)
	
		local headers = {}
		local body = paciente:toJson()
		local params = {}
  
		headers["Content-Type"] = "application/json; charset=utf-8" 
		params.headers = headers
		params.body = body		

		network.request( "http://192.168.0.105:8084/CadastroCliente/rest/clientes/", "POST", networkListener, params)
	
end

function networkListener(event) 
    if ( event.isError ) then
        print( "Network error: ", event.response )
    else
        print ( "RESPONSE: " .. event.response )
    end
end

return PacienteModel