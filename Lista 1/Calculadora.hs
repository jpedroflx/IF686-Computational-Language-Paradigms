type Comando = String
type Valor = Int

executa :: [(Comando, Valor)] -> Int
executa comandos = calcula 0 comandos

calcula :: Int -> [(Comando, Valor)] -> Int
calcula valor [] = valor
calcula valor (("Multiplica", v) : cmds) = calcula (valor * v) cmds
calcula valor (("Soma", v) : cmds) = calcula (valor + v) cmds
calcula valor (("Subtrai", v) : cmds) = calcula (valor - v) cmds
calcula _ (("Divide", 0) : _) = -666
calcula valor (("Divide", v) : cmds) = calcula (valor `div` v) cmds
calcula valor (_ : cmds) = calcula valor cmds

main :: IO ()
main = do
  input <- getLine
  let comandos = read input :: [(Comando, Valor)]
  let result = executa comandos
  print result
