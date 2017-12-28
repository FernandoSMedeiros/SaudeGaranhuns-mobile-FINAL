local json = require("json")

local PostoModel = {postos}

function PostoModel:criar()
	self:buscar()	
	return self
end

function PostoModel:buscar()
	network.request("http://10.28.3.143:8080/postos", "GET", busca)		
end

function busca (event)
	if ( event.isError ) then
        print( "Network error: ", event.response )        
    else
    	local tabela = json.decode(event.response)
    	PostoModel.postos = tabela
    	--print(event.response)
    end
end

return PostoModel

