somarListas :: [Int] -> [Int] -> [Int]
somarListas a b = reverse (somaReversa (reverse a) (reverse b) 0)

somaReversa :: [Int] -> [Int] -> Int -> [Int]
somaReversa [] [] 0 = []
somaReversa [] [] carry = [carry]
somaReversa [] (y:ys) carry =
  let sumResult = y + carry
      digit = sumResult `mod` 10
      newCarry = sumResult `div` 10
  in digit : somaReversa [] ys newCarry
somaReversa (x:xs) [] carry =
  let sumResult = x + carry
      digit = sumResult `mod` 10
      newCarry = sumResult `div` 10
  in digit : somaReversa xs [] newCarry
somaReversa (x:xs) (y:ys) carry =
  let sumResult = x + y + carry
      digit = sumResult `mod` 10
      newCarry = sumResult `div` 10
  in digit : somaReversa xs ys newCarry

main :: IO ()
main = do
  input1 <- getLine
  input2 <- getLine
  let result = somarListas (read input1 :: [Int]) (read input2 :: [Int])
  print result
