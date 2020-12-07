import System.IO (isEOF)
import Data.List
import Data.Char (isSpace)
import Control.Monad
import Data.Map (fromList, difference)

to_pair :: String -> (String, Bool)
to_pair token = (take 3 token, True)

to_pair_map :: String -> [(String, Bool)]
to_pair_map raw = map (\x -> to_pair x) (words raw)

check_list = fromList [("byr", True), ("iyr", True), ("eyr", True), ("hgt", True), ("hcl", True), ("ecl", True), ("pid", True)]

main :: IO ()
main = do
    raw <- getContents
    let input = lines raw
    let blocks = groupBy (\a -> \b -> length b >= 1) input
    let pass = map (\x -> fromList$ to_pair_map$ unwords$ x) blocks
    let valid = map (\x -> difference check_list x) pass
    let count = length$ (filter (\x -> length x == 0) valid)
    print count
    
