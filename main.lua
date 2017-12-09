local consulta = require("model.Consulta")

local json = require("json")

--{especialidade, prioridade, status, dataSolicitacao, dataAgendamento, paciente}
local nova = consulta:criar("Clinico", "Idoso", "Vivo", "iuhiuhuh", "kkkkkk", "Eu se ainda vivo")

print(nova:toJson())

local tabela = { nome = "dfhguihdf", tel = "kjfhguihfudi", paciente = {nome = "djhuis", idade = "hdui"}}

print(json.encode(tabela))



local minha = json.decode(nova:toJson())

print( "Oia ai : " .. minha.especialidade )