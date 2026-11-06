data Cafe = Cafe String Double Int

descrever :: Cafe -> String
descrever (Cafe nome preco _) = nome ++ " - R$" ++ show preco

forca :: Cafe -> String
forca (Cafe _ _ intensidade)
    | intensidade >= 8 = "Forte"
    | intensidade >= 5 = "Equilibrado"
    | otherwise = "Suave"

precoDoPedido :: Bool -> Cafe -> Double
precoDoPedido comLeite (Cafe _ preco _) =
    if comLeite
        then preco + 2.0
        else preco

main :: IO ()
main = do
    let cafeSuave = Cafe "Blend da Casa" 8.0 3
    let cafeEquilibrado = Cafe "Café Coado" 10.0 6
    let cafeForte = Cafe "Expresso Duplo" 12.0 9

    putStrLn (descrever cafeSuave ++ " | " ++ forca cafeSuave)
    putStrLn (descrever cafeEquilibrado ++ " | " ++ forca cafeEquilibrado)
    putStrLn (descrever cafeForte ++ " | " ++ forca cafeForte)

    print (precoDoPedido True cafeForte)
    print (precoDoPedido False cafeForte)