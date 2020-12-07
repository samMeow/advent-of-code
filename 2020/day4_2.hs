import System.IO (isEOF)
import Data.List
import Data.Char (isSpace)
import Control.Monad
import Data.Map (fromList, difference, toList)
import Text.Regex (matchRegex, mkRegex) -- require regex-compat
import Data.Maybe (isJust)

to_pair :: String -> (String, String)
to_pair token = (take 3 token, drop 4 token)

to_pair_map :: String -> [(String, String)]
to_pair_map raw = map (\x -> to_pair x) (words raw)

check_list = fromList [("byr", True), ("iyr", True), ("eyr", True), ("hgt", True), ("hcl", True), ("ecl", True), ("pid", True)]

check_valid :: (String, String) -> Bool
check_valid ("byr", x) = let year = read x :: Integer in year >= 1920 && year <= 2002
check_valid ("iyr", x) = let year = read x :: Integer in year >= 2010 && year <= 2020
check_valid ("eyr", x) = let year = read x :: Integer in year >= 2020 && year <= 2030
check_valid ("hgt", x) =
    let unit = drop (length x - 2) x in
    case unit of
        "in" -> size >= 59 && size <= 76
        "cm" -> size >= 150 && size <= 193
        _ -> False
    where size= read (take (length x - 2) x) :: Integer
check_valid ("hcl", x) = isJust$ matchRegex (mkRegex "^#[a-f0-9]{6}$") x
check_valid ("ecl", x) = elem x ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
check_valid ("pid", x) = isJust$ matchRegex (mkRegex "^[0-9]{9}$") x
check_valid ("cid", x) = True
check_valid (_, _) = False

check_pass pass = length (difference check_list pass) == 0 && (all check_valid (toList pass))

main :: IO ()
main = do
    raw <- getContents
    let input = lines raw
    let blocks = groupBy (\a -> \b -> length b >= 1) input
    let pass = map (\x -> fromList$ to_pair_map$ unwords$ x) blocks
    let valid = map (\x -> check_pass x) pass
    let count = length$ (filter (\x -> x) valid)
    print count
    
