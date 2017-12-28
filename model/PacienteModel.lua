local json = require("json")
local composer = require("composer")

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

		network.request( "http://192.168.0.105:8080/pacientes", "POST", networkListener, params)
	
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

    if (event.status == 201) then
    	local alert = native.showAlert( "Concluido", "Paciente cadastrado!", { "OK" }, onComplete )
    end	
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
	composer.gotoScene("view.Login")
end

return PacienteModel