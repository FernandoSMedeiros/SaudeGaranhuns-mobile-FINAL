local json = require("json")

local PostoModel = {}

posto = "vdsok"

function PostoModel:criar()
	PostoModel:buscar()	
	return self
end

function PostoModel:buscar()
	network.request("http://viacep.com.br/ws/01001000/json/", "GET", busca)		
end

function busca (event)
	if ( event.isError ) then
        print( "Network error: ", event.response )        
    else
    	--local tabela = json.decode(event.response)
    	--print(event.response)
    end
end

return PostoModel

