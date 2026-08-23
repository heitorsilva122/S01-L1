function gerarTabelaPotencias(M, N, B)
    for i = M, N do
        local exponencial = math.floor(B ^ i)
        print(B .. " ^ " .. i .. " = " .. exponencial)
    end
end

print("Digite o expoente inicial (M):")
local M = tonumber(io.read())

print("Digite o expoente final (N):")
local N = tonumber(io.read())

print("Digite a base:")
local B = tonumber(io.read())

gerarTabelaPotencias(M, N, B)