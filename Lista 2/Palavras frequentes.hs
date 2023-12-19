import Data.List
import Data.Ord (comparing)

palavrasFrequentes :: [String] -> [String]
palavrasFrequentes words = take 3 $ map fst $ sortBy (comparing snd <> comparing fst) $ frequencyCount words

frequencyCount :: Ord a => [a] -> [(a, Int)]
frequencyCount xs = map (\g -> (head g, length g)) $ group $ sort xs

main :: IO ()
main = do
    lista <- getLine
    print $ palavrasFrequentes (read lista :: [String])
