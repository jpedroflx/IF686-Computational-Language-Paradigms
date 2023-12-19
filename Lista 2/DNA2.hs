data Animal = Cisnal | Iguanoide | Narvale
  deriving (Eq, Show)

dna2 :: [String] -> [String] -> [Int]
dna2 envelope0 envelope1 = map (\animal -> countOccurrences animal classified) [Cisnal, Iguanoide, Narvale]
  where
    classified = map (classifySimilarity . calculateSimilarity envelope0 envelope1) [0..minimum [length envelope0, length envelope1] - 1]

countOccurrences :: Eq a => a -> [a] -> Int
countOccurrences x = length . filter (== x)

classifySimilarity :: Float -> Animal
classifySimilarity similarity
  | similarity >= 0.1 && similarity <= 0.3 = Cisnal
  | similarity >= 0.4 && similarity <= 0.7 = Iguanoide
  | similarity >= 0.8 = Narvale
  | otherwise = error "Invalid similarity value"

calculateSimilarity :: [String] -> [String] -> Int -> Float
calculateSimilarity envelope0 envelope1 j = similarity
  where
    similarity = sum [if charEnvelope0 == charEnvelope1 then 1.0 else 0.0 | i <- [0..min lengthEnvelope0 lengthEnvelope1 - 1],
                     let charEnvelope0 = envelope0 !! j !! i,
                     let charEnvelope1 = envelope1 !! j !! i]
    lengthEnvelope0 = fromIntegral $ length (envelope0 !! j)
    lengthEnvelope1 = fromIntegral $ length (envelope1 !! j)

main :: IO ()
main = do
    firstExtract <- words <$> getLine
    secondExtract <- words <$> getLine
    let result = dna2 firstExtract secondExtract
    print result
