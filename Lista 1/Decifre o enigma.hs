import Data.List (lookup)

decEnigma :: String -> [(Char, Char)] -> String
decEnigma str mappings = map (decipherChar mappings) str

decipherChar :: [(Char, Char)] -> Char -> Char
decipherChar mappings char = case lookup char mappings of
  Just decodedChar -> decodedChar
  Nothing -> char

main :: IO ()
main = do
  input1 <- getLine
  input2 <- getLine
  let str = input1
  let mappings = read input2 :: [(Char, Char)]
  let result = decEnigma str mappings
  print result
