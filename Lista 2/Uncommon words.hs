import Data.List
import Data.Char (toLower)

uncommonFromTwoSentences :: String -> String -> [String]
uncommonFromTwoSentences sentence1 sentence2 = sort $ nub $ filter isUncommon (wordsToLower sentence1 ++ wordsToLower sentence2)
  where
    wordsToLower = map (map toLower) . words
    isUncommon word = countOccurrences word (wordsToLower sentence1 ++ wordsToLower sentence2) == 1

countOccurrences :: Eq a => a -> [a] -> Int
countOccurrences x = length . filter (== x)

main :: IO ()
main = do
    sentence1 <- getLine
    sentence2 <- getLine
    let result = uncommonFromTwoSentences sentence1 sentence2
    print result
