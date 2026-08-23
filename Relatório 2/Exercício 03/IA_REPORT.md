# Nome: Heitor Luis Oliveira Silva
# Matricula: 845

# Histórico de Prompts:

## 1:

"como eu faço para excluir um item de uma tabela em LUA?"

## 2:

"fiz uma função para remover alguns valores menores que um valor k, mas ele da um erro quando tem que remover mais de 1 elemento, como eu faço para ajustar os indicies e fazer a função funcionar como deveria?
a função ficou assim:

function contarOcorrencias(tabela, k)
    for i = 1, #tabela do
        if tabela[i] <= k then
            table.remove(tabela, i)
        end
    end
    print("Elementos maiores que " .. k .. ":")
    for i = 1, #tabela do
        print(tabela[i])
    end
end
e esta dando esse erro:
"lua: Main.lua:3: attempt to compare nil with number stack traceback:     Main.lua:3: in function 'contarOcorrencias'     Main.lua:28: in main chunk     [C]: in ?""

# Respostas Obtidas

## 1:

"Em Lua, a forma depende de como a tabela está estruturada.

1. Tabela como array (lista sequencial) — use table.remove

lua
local frutas = {"maçã", "banana", "laranja"}

table.remove(frutas, 2)  -- remove "banana" (índice 2)
-- frutas agora é {"maçã", "laranja"}, os índices são reajustados automaticamente

table.remove(frutas)  -- sem índice, remove o último elemento

Isso desloca os elementos seguintes para preencher o buraco, mantendo a tabela sem "furos".

2. Tabela como dicionário (chave/valor) — atribua nil

lua
local pessoa = {nome = "João", idade = 30, cidade = "SP"}

pessoa.cidade = nil  -- remove a chave "cidade"
-- ou: pessoa["cidade"] = nil

3. Removendo por valor (não por índice)
Se você não sabe o índice e quer remover pelo valor, precisa procurar primeiro:

lua
local frutas = {"maçã", "banana", "laranja"}

for i, v in ipairs(frutas) do
    if v == "banana" then
        table.remove(frutas, i)
        break
    end
end

Cuidado com um erro comum:
Não use frutas[i] = nil num array se quiser manter a sequência — isso deixa um "buraco" e quebra o ipairs() a partir dali:

lua
local frutas = {"maçã", "banana", "laranja"}
frutas[2] = nil
-- frutas[1] = "maçã", frutas[2] = nil, frutas[3] = "laranja"
-- ipairs(frutas) vai parar no índice 1!

Nesse caso, table.remove é sempre mais seguro para arrays.

Isso é para o seu tracker de import/consumo, ou é outro projeto em Lua?"

## 2:

"O problema é clássico: quando você usa table.remove dentro de um loop for i = 1, #tabela do, dois problemas acontecem ao mesmo tempo:

#tabela é calculado uma vez só, no início do loop. Se a tabela tem 5 elementos, o loop vai tentar rodar i de 1 até 5 — mesmo que a tabela já tenha encolhido para 3 elementos no meio do caminho.
Ao remover um elemento, tudo desloca uma posição para trás. Se você removeu o índice 2, o que era índice 3 vira índice 2. Mas o loop já vai pular direto pro índice 3, pulando um elemento sem verificar — e no final, tenta acessar um índice que não existe mais, daí o erro de comparar nil com número.

Solução 1: percorrer de trás para frente (a mais simples)

Assim, remover um elemento só afeta índices que você já passou:

lua
function contarOcorrencias(tabela, k)
    for i = #tabela, 1, -1 do
        if tabela[i] <= k then
            table.remove(tabela, i)
        end
    end
    print("Elementos maiores que " .. k .. ":")
    for i = 1, #tabela do
        print(tabela[i])
    end
end

Solução 2: construir uma tabela nova (mais segura e clara)

Em vez de remover elementos "in place", você cria uma tabela nova só com o que interessa. É geralmente a abordagem mais recomendada em Lua, porque evita esse tipo de bug de índice:

lua
function contarOcorrencias(tabela, k)
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
    return resultado
end

Por que evitar a "Solução errada" (forward com ajuste manual de i)?
Dá pra fazer funcionar decrementando i manualmente toda vez que remove, mas fica mais confuso de ler e mais fácil de errar de novo no futuro. Prefira uma das duas acima.

Qual das duas você prefere usar? Se for continuar usando a tabela original depois (por referência), a solução 1 é melhor. Se quiser manter a original intacta, a solução 2."

# Relatório:

Eu fiz duas perguntas pra ia, mas acabou que eu não usei a primeira, antes minha ideia era apenas remover os itens da tabela, mas sempre dava problema na hora de remover o segundo elemento por conta da mudança de indicies, então pedi para a ia me explicar como concertar e ela me deu duas soluções, decidi usar a segunda, mas também achei a primeira solução interessante