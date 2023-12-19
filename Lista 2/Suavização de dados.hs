suaviza :: [Float] -> [Float]
suaviza [] = []  -- Caso base: lista vazia
suaviza [x] = [x]  -- Caso base: lista com um elemento
suaviza (x:y:z:xs) = x : (x + y + z) / 3 : z : suaviza xs

main :: IO ()
main = do
    lista <- getLine
    print $ suaviza (read lista :: [Float])
