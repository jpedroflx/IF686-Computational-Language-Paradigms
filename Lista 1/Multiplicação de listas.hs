mul2 :: [Int] -> [Int] -> [Int]
mul2 xs ys = zipWith (*) (padToLength (max lenX lenY) 0 xs) (padToLength (max lenX lenY) 0 ys)
  where
    lenX = length xs
    lenY = length ys

padToLength :: Int -> a -> [a] -> [a]
padToLength n padding xs = xs ++ replicate (n - length xs) padding

main :: IO ()
main = do
  sa <- getLine
  let a = read sa :: [Int]
  sb <- getLine
  let b = read sb :: [Int]
  let result = mul2 a b
  print result
