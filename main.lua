local consulta = require("model.Consulta")
local paciente = require("model.Paciente")
local posto = require("model.Posto")
local endereco = require("model.Endereco")
local bairro = require("model.Bairro")

local json = require("json")
-- ********************************************** CONSULTA ******************************************
--{especialidade, prioridade, status, dataSolicitacao, dataAgendamento, paciente}
--[[local nova = consulta:criar("Clinico", "Idoso", "Vivo", "iuhiuhuh", "kkkkkk", "Eu se ainda vivo")
print(nova:toJson())

local tabela = { nome = "dfhguihdf", tel = "kjfhguihfudi", paciente = {nome = "djhuis", idade = "hdui"}}
print(json.encode(tabela))

local minha = json.decode(nova:toJson())

print( "Oia ai : " .. minha.especialidade )--]]

-- **************************** PACIENTE **********************************************************

-- {nome, cartaoSus, dataNasc, posto}

--[[local p = paciente:criar("Fernando", "564654456484", "26-06-1992", "uihui")

print(p:toJson())

local tabela = json.decode(p:toJson())

print("paciente: " .. p.posto)--]]

-- *************************** POSTO ************************************************************

-- {nome, endereco}

-- local p = posto:criar("uifyhgui", "uifyhgur")

-- print(p:toJson())

-- *************************** Endereco ************************************************************

-- Atributos Posto: {nome, endereco}
-- Atributos Paciente: {nome, cartaoSus, dataNasc, posto}
-- Atributos Consulta: {especialidade, prioridade, status, dataSolicitacao, dataAgendamento, paciente}

local bai = bairro:criar("Indiano")
local ende = endereco:criar("Logo Ali", "58", bai)

local posto = posto:criar("uifyhgui", ende)
local paciente = paciente:criar("Fernando", "564654456484", "26-06-1992", posto)

print(bai:toJson())
print(ende:toJson())
print(posto:toJson())
print(paciente:toJson())

