module Process where 

import System.IO

numberLines :: String -> String
numberLines contents =
    let allLines = lines contents
        numbered = zipWith (\n line -> show n ++ ": " ++ line) [1..] allLines
    in unlines numbered

main :: IO ()
main = do
    c <- readFile "src/flightsdata.json"
    writeFile "result.txt" (numberLines c)
