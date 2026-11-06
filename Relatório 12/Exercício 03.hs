data Esboco = Esboco
    { titulo :: String
    , tecnica :: String
    , horas :: Int
    }

esbocoMaisRecente :: [Esboco] -> String
esbocoMaisRecente [] = "O caderno está vazio"
esbocoMaisRecente (e:_) = titulo e ++ " - " ++ tecnica e

contarEsbocos :: [Esboco] -> Int
contarEsbocos [] = 0
contarEsbocos (_:resto) = 1 + contarEsbocos resto

horasDesenhando :: [Esboco] -> Int
horasDesenhando [] = 0
horasDesenhando (e:resto) = horas e + horasDesenhando resto

main :: IO ()
main = do
    let caderno =
            [ Esboco "Criatura das Sombras" "nanquim" 3
            , Esboco "Ruínas Esquecidas" "grafite" 5
            , Esboco "Floresta Morta" "carvão" 4
            ]

    putStrLn (esbocoMaisRecente caderno)
    print (contarEsbocos caderno)
    print (horasDesenhando caderno)

    putStrLn (esbocoMaisRecente [])

    let novoEsboco = Esboco "Olhos na Névoa" "nanquim" 2
    let cadernoNovo = novoEsboco : caderno

    putStrLn (esbocoMaisRecente cadernoNovo)
    print (contarEsbocos cadernoNovo)

    putStrLn (esbocoMaisRecente caderno)
    print (contarEsbocos caderno)

    -- putStrLn (titulo (head []))
    -- Erro em tempo de execução: Prelude.head: empty list