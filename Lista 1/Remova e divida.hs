remDiv :: Int -> [a] -> ([a], [a])
remDiv n xs = case splitAt (n-1) xs of
  (xs1, x:xs2) -> (xs1, xs2)
  (xs1, []) -> (xs1, [])

main :: IO ()
main = do
  n <- readLn
  xs <- getLine
  let result = remDiv n (words xs)
  print result
