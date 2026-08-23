function calcularDiferencaAbsoluta(a, b)
    if a >= b then
        local resultado = a - b
        print("Diferenca: " .. resultado)
    else
        local resultado = b - a
        print("Diferenca: " .. resultado)
    end
end

function encontrarMaior(a, b)
    if a >= b then
        print("Maior valor: " .. a)
    else
        print("Maior valor: " .. b)
    end
end

function calcularMedia(a, b)
    local media = (a + b) / 2
    print("Media: " .. media)
end

local tabela = {}

print("Digite o primeiro número:")
local n1 = tonumber(io.read())

print("Digite o segundo número:")
local n2 = tonumber(io.read())

print("Digite a operação (media, maior ou diferenca):")
local op = io.read()

if op == "media" then
    calcularMedia(n1, n2)
end

if op == "maior" then
    encontrarMaior(n1, n2)
end

if op == "diferenca" then
    calcularDiferencaAbsoluta(n1, n2)
end