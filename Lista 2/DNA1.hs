data Tree t = Node t (Tree t) (Tree t) | Nilt
  deriving (Read, Show)

convertValue :: Int -> Char
convertValue val = case val `mod` 5 of
  0 -> 'E'
  1 -> 'M'
  2 -> 'A'
  3 -> 'C'
  _ -> 'S'

dna1 :: Tree Int -> [String]
dna1 tree = convertTreeToLists tree
  where
    convertTreeToLists Nilt = []
    convertTreeToLists (Node val left right) =
      let charVal = convertValue val
          leftLists = convertTreeToLists left
          rightLists = convertTreeToLists right
          mergedLists = mergeLists charVal leftLists rightLists
      in mergedLists

    mergeLists :: Char -> [String] -> [String] -> [String]
    mergeLists _ [] [] = []
    mergeLists c [] (r:rs) = (c : r) : mergeLists c [] rs
    mergeLists c (l:ls) [] = (c : l) : mergeLists c ls []
    mergeLists c (l:ls) (r:rs) = (c : l ++ r) : mergeLists c ls rs

main :: IO ()
main = do
  input <- getLine
  let result = dna1 (read input :: Tree Int)
  mapM_ putStrLn result
