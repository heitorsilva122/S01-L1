function filtrarMaiores(tabela, k)
    local resultado = {}
    for i = 1, #tabela do
        if tabela[i] > k then
            table.insert(resultado, tabela[i])
        end
    end
    print("Elementos maiores que " .. k .. ":")
    for i = 1, #resultado do
        print(resultado[i])
    end
end

local tabela = {}

print("Digite a quantidade de elementos (N):")
local N = tonumber(io.read())

for i = 1, N do
    print("Digite o elemento " .. i .. ":")
    local elemento = tonumber(io.read())
    table.insert(tabela, elemento)
end

print("Digite o valor limite (K): ")
local k = tonumber(io.read())

filtrarMaiores(tabela, k)