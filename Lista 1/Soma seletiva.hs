import Data.Char (isDigit)

sumNumbers :: String -> Int
sumNumbers = sum . map digitToInt . filter isDigit

digitToInt :: Char -> Int
digitToInt c = fromEnum c - fromEnum '0'

main :: IO ()
main = do
  a <- getLine
  let result = sumNumbers a
  print result
