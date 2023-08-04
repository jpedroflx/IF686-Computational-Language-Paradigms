import Data.List (sort)

minMaxCartao :: String -> (Double, Double)
minMaxCartao fatura =
  let valores = parseFatura fatura
  in (minimum valores, maximum valores)

parseFatura :: String -> [Double]
parseFatura fatura =
  let registros = wordsWhen (== ';') fatura
      valores = map (\(_, _, valor) -> readDouble valor) (extractValues registros)
  in filter (\x -> x /= 0.0) valores

wordsWhen :: (Char -> Bool) -> String -> [String]
wordsWhen p s = case dropWhile p s of
  "" -> []
  s' -> w : wordsWhen p s''
    where (w, s'') = break p s'

extractValues :: [String] -> [(String, String, String)]
extractValues [] = []
extractValues (data':tipo:valor:resto) = (data', tipo, valor) : extractValues resto
extractValues _ = []

readDouble :: String -> Double
readDouble s = case reads s of
  [(x, "")] -> x
  _ -> 0.0

main :: IO ()
main = do
  a <- getLine
  let result = minMaxCartao a
  print result
