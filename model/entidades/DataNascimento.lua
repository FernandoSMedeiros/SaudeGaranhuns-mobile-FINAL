local DataNascimento = {year, month, day}

function DataNascimento:criar()	
	self.year = 1
	self.month = 1
	self.day = 1
	return self
end

function DataNascimento:toJson()
    return '{' .. '"year":'.. '"' .. self.year .. '",'
               .. '"month":' .. '"' .. self.month .. '",'
               .. '"day":' .. '"' .. self.day .. '"'               
               .. '}'
end

return DataNascimento