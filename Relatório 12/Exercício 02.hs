pesoMaximo :: Double
pesoMaximo = 10.0

-- pesoMaximo = 15.0
-- Erro de compilação: Multiple declarations of 'pesoMaximo'

data Encomenda = Encomenda
    { destinatario :: String
    , peso :: Double
    , frete :: Double
    }

descrever :: Encomenda -> String
descrever e = destinatario e ++ " - " ++ show (peso e) ++ "kg - R$" ++ show (frete e)

cabemNaVassoura :: [Encomenda] -> [Encomenda]
cabemNaVassoura = filter (\e -> peso e <= pesoMaximo)

totalDeFretes :: [Encomenda] -> Double
totalDeFretes = sum . map frete

main :: IO ()
main = do
    let encomendas =
            [ Encomenda "Osono" 4.0 15.0
            , Encomenda "Senhora Idosa" 7.5 20.0
            , Encomenda "Pintor" 12.0 30.0
            , Encomenda "Barbara" 9.0 18.0
            ]

    mapM_ (putStrLn . descrever) encomendas

    let encomendasQueCabem = cabemNaVassoura encomendas
    mapM_ (putStrLn . descrever) encomendasQueCabem

    print (totalDeFretes encomendasQueCabem)