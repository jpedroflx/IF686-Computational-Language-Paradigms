data Tree t = Nilt |
              Node t (Tree t) (Tree t)
              deriving (Read)

isBST :: Ord t => Tree t -> Bool
isBST tree = isBST' tree Nothing Nothing
  where
    isBST' Nilt _ _ = True
    isBST' (Node val left right) minVal maxVal =
      case (minVal, maxVal) of
        (Just minV, Just maxV) | val > minV && val < maxV ->
          isBST' left minVal (Just val) && isBST' right (Just val) maxVal
        (Nothing, Just maxV) | val < maxV ->
          isBST' left Nothing (Just val) && isBST' right (Just val) maxVal
        (Just minV, Nothing) | val > minV ->
          isBST' left minVal (Just val) && isBST' right (Just val) Nothing
        (Nothing, Nothing) ->
          isBST' left Nothing (Just val) && isBST' right (Just val) Nothing
        _ -> False

main :: IO ()
main = do
  s <- getLine
  let result = isBST (read s :: Tree Int)
  print result
