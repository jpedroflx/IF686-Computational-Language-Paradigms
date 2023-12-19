maquinaSomar :: [Int] -> [Int]
maquinaSomar nums = reverse $ go nums 0 []
  where
    go [] 0 result = result
    go [] currSum result = currSum : result
    go (x:xs) 0 result
      | x == 0 = go xs 0 result
      | otherwise = go xs x result
    go (x:xs) currSum result
      | x == 0 = go xs 0 (currSum : result)
      | otherwise = go xs (currSum + x) result

main :: IO ()
main = do
    lista <- getLine
    print $ maquinaSomar (read lista :: [Int])
