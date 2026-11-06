data Etapa = NaFila | NoBanho | Concluido deriving (Show, Eq)

data Atendimento = Atendimento
    { cliente :: String
    , servico :: String
    , valor :: Double
    , etapa :: Etapa
    }

descrever :: Atendimento -> String
descrever a = cliente a ++ " - " ++ servico a ++ " - " ++ show (etapa a)

concluir :: Atendimento -> Atendimento
concluir a = a { etapa = Concluido }

arrecadado :: [Atendimento] -> Double
arrecadado = sum . map valor . filter (\a -> etapa a == Concluido)

main :: IO ()
main = do
    let atendimentos =
            [ Atendimento "Haku" "Banho de Ervas" 50.0 NaFila
            , Atendimento "Sem-Rosto" "Massagem" 80.0 NoBanho
            , Atendimento "Espírito do Rio" "Banho Purificador" 100.0 NaFila
            ]

    let [a1, a2, a3] = atendimentos
    let atendimentosAtualizados = [concluir a1, a2, concluir a3]

    mapM_ (putStrLn . descrever) atendimentos
    print (arrecadado atendimentos)

    mapM_ (putStrLn . descrever) atendimentosAtualizados
    print (arrecadado atendimentosAtualizados)