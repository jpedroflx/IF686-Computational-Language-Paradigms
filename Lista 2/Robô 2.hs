data Command = Forward Int | Backward Int | TurnLeft | TurnRight 
               deriving (Eq, Show, Read)

data Direction = North | South | West | East
                 deriving (Read, Show)

faces :: Direction -> [Command] -> Direction
faces dir [] = dir
faces dir (cmd:cmds) = case cmd of
    Forward _ -> faces (move dir cmd) cmds
    Backward _ -> faces (move dir cmd) cmds
    TurnLeft -> faces (rotateLeft dir) cmds
    TurnRight -> faces (rotateRight dir) cmds
    where
        move North (Forward _) = South
        move South (Forward _) = North
        move West (Forward _) = East
        move East (Forward _) = West
        move North (Backward _) = South
        move South (Backward _) = North
        move West (Backward _) = East
        move East (Backward _) = West
        
        rotateLeft North = West
        rotateLeft South = East
        rotateLeft West = South
        rotateLeft East = North
        
        rotateRight North = East
        rotateRight South = West
        rotateRight West = North
        rotateRight East = South

main :: IO ()
main = do
    a <- getLine
    b <- readLn
    let result = faces (read a) b
    print result
