local composer = require( "composer" )
local json = require("json")
local co = require("model.entidades.Consulta")
local composer = require("composer")
local io = require("io")
local http = require("socket.http")
--local ltn12 = require("ltn12")

local ConsultaModel = {consulta}

function ConsultaModel:criar()
	self.consulta = co:criar()
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
		
		network.request( "http://10.28.3.143:8080/consultas", "POST", networkListener, params)
	
end

function ConsultaModel:atualizar()
	
		local headers = {}
		local body = self.consulta:toJson()
		local params = {}
  
		headers["Content-Type"] = "application/json; charset=utf-8" 
		params.headers = headers
		params.body = body		
		network.request( "http://10.28.3.143:8084/CadastroCliente/rest/clientes/", "PUT", networkListener, params)
	
end

function ConsultaModel:buscar(id)	
	r = http.request("http://10.28.3.143:8080/consultas/?id=" .. id)
		return json.decode(r)
end	
	


function networkListener(event) 
    if ( event.isError ) then
        print( "Status: ", event.status )
    else
        print ( "Status: " .. event.status )
    end

    if (event.status == 201) then
    	local alert = native.showAlert( "Concluido", "Consulta cadastrada!", { "OK" }, onComplete )
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
	composer.gotoScene("view.MenuPrincipal")
end



return ConsultaModel