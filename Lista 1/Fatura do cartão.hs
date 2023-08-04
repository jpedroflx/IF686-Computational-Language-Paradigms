logMes :: String -> String -> Double
logMes mes fatura = sum (filtrarCompras mes (parseFatura fatura))

filtrarCompras :: String -> [(String, Double)] -> [Double]
filtrarCompras mes compras = [valor | (m, valor) <- compras, m == mes]

parseFatura :: String -> [(String, Double)]
parseFatura fatura = parseLinhas (splitStringByChar ';' fatura)

parseLinhas :: [String] -> [(String, Double)]
parseLinhas [] = []
parseLinhas (dataStr:_:valorStr:_) =
  let mes = take 3 dataStr
      valor = read valorStr
  in [(mes, valor)]
parseLinhas (_:resto) = parseLinhas resto


splitStringByChar :: Char -> String -> [String]
splitStringByChar _ "" = []
splitStringByChar char str =
  let (part, rest) = break (== char) str
  in part : splitStringByChar char (drop 1 rest)

main :: IO ()
main = do
  mes <- getLine
  fatura <- getLine
  let result = logMes mes fatura
  print result

