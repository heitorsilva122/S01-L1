# Nome: Heitor Luis Oliveira Silva
# Matricula: 845

# Prompt Utilizado:
"como fazer uma variável que calcula exponencial em LUA?"

# Resposta Obtida:
"Em Lua, você usa o operador ^ para exponenciação:

lua
local base = 2
local expoente = 10
local resultado = base ^ expoente

print(resultado)  -- 1024.0
Alguns pontos importantes:

1. O resultado é sempre float
Mesmo com números inteiros, ^ retorna um número de ponto flutuante (1024.0, não 1024). Se precisar de inteiro, use math.floor():

lua
local resultado = math.floor(base ^ expoente)

2. Expoentes negativos e fracionários funcionam

lua
print(2 ^ -1)    -- 0.5
print(4 ^ 0.5)   -- 2.0 (raiz quadrada)
print(8 ^ (1/3)) -- 2.0 (raiz cúbica)

3. Alternativa com math.exp (para e^x)
Se você quer especificamente a exponencial natural (base e):

lua
local resultado = math.exp(x)  -- e^x

4. Precedência do operador

^ tem precedência bem alta e é associativo à direita:

lua
print(2 ^ 3 ^ 2)  -- 512 (calcula como 2^(3^2), não (2^3)^2)
print(-2 ^ 2)     -- -4 (o menos é aplicado depois: -(2^2))
Se estiver usando isso dentro de uma função ou classe, me diga o contexto que posso ajustar o exemplo."

# Relatório:

essa resposta foi bem completa e me mostrou que existe uma função ja inclusa em Lua para calcular exponenciação, diferente de
C++, onde eu tenho que incluir uma biblioteca apenas para usar algumas funções matematicas um pouco mais complexas, isso me mostrou como as linguagens de programação realmente são diferentes entre si e que uma por acabar por ter muitas funções ja inclusas por si mesma, enquanto outras não possuem tanto assim, e como a ia também mostrou como deixar o resultado em formato de int e não de float eu aproveitei para incluir isso no meu codigo