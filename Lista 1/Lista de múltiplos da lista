somarMultiplos :: [Int] -> Int -> [Int]
somarMultiplos lista m = map (somaMultiplos m) lista

somaMultiplos :: Int -> Int -> Int
somaMultiplos m num
  | m == 0 || m > num = 0
  | otherwise = sum [n | n <- [m, 2 * m .. num]]

main :: IO ()
main = do
  inputList <- getLine
  let lista = read inputList :: [Int]
  inputNum <- getLine
  let m = read inputNum :: Int
  let result = somarMultiplos lista m
  print result
