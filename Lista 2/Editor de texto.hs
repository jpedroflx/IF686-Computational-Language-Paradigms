data Cmd = Cursor Int
         | Backspace Int
         | Delete Int
         | Insert String
         deriving (Read)

editText :: String -> [Cmd] -> String
editText str cmds = executeCommands str 0 cmds

executeCommands :: String -> Int -> [Cmd] -> String
executeCommands str _ [] = str
executeCommands str cursor (cmd:cmds) = case cmd of
    Cursor n      -> let newCursor = max 0 (min (length str) (cursor + n))
                      in executeCommands str newCursor cmds
    Backspace n   -> let (before, after) = splitAt (max 0 (cursor - n)) str
                          newCursor = max 0 (length before)
                      in executeCommands (before ++ drop (max 0 (cursor - n)) after) newCursor cmds
    Delete n      -> let (before, after) = splitAt cursor str
                      in executeCommands (before ++ drop (min (length after) n) after) cursor cmds
    Insert s      -> let (before, after) = splitAt cursor str
                      in executeCommands (before ++ s ++ after) (cursor + length s) cmds

main :: IO ()
main = do
    inputStr <- getLine
    cmdsStr <- getLine
    let result = editText inputStr (read cmdsStr)
    print result
