local DataSolicitacao = {year, month, day}
local date = os.date("*t")


function DataSolicitacao:criar()	
	self.year = date.year
	self.month = date.month
	self.day = date.day
	return self
end

function DataSolicitacao:toJson()
    return '{' .. '"year":' .. self.year .. ','
               .. '"month":' .. self.month .. ','
               .. '"day":'  .. self.day                
               .. '}'
end

return DataSolicitacao