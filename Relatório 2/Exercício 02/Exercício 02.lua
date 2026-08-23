function contarOcorrencias(tabela, X)
    local contador = 0
    for i = 1, #tabela do
        if tabela[i] == X then
        contador = contador + 1
        end
    end
    print("O número " .. X .. " aparece " .. contador .. " vez(es) na tabela")
end

local tabela = {}

print("Digite a quantidade de elementos (N):")
local N = tonumber(io.read())

for i = 1, N do
    print("Digite o elemento " .. i .. ":")
    local elemento = tonumber(io.read())
    table.insert(tabela, elemento)
end

print("Digite o número a ser buscado: ")
local X = tonumber(io.read())

contarOcorrencias(tabela, X)