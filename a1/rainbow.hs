import RainbowAssign
import qualified Data.Map as Map
import Data.Maybe as Maybe

pwLength, nLetters, width, height :: Int
filename :: FilePath
pwLength = 8            -- length of each password
nLetters = 5            -- number of letters to use in passwords: 5 -> a-e
width = 40              -- length of each chain in the table
height = 1000           -- number of "rows" in the table
filename = "table.txt"  -- filename to store the table

-- Function 1 - pwReduce
pwReduce :: Hash -> Passwd
pwReduce hash = map toLetter truncatedBaseN
    where 
        truncatedBaseN =  reverse (take pwLength (convertBaseN (fromIntegral hash) nLetters))

-- Base conversion helper
convertBaseN :: Int -> Int -> [Int]
convertBaseN hash n = [remainder] ++ convertBaseN quotient n
    where 
        remainder = hash `mod` n
        quotient = hash `div` n

-- Function 2 - rainbowTable
rainbowTable :: Int -> [Passwd] -> Map.Map Hash Passwd
rainbowTable tableWidth passwords = Map.fromList rainbowList
    where 
        rainbowList = finalHash (rainbowify initialList tableWidth)
        initialList = map (\pw -> (pw, pw)) passwords

rainbowify :: [(Passwd, Passwd)] -> Int -> [(Passwd, Passwd)]
rainbowify list 0 = list
rainbowify list iterations = rainbowify (map hashAndReduceTouple list) (iterations-1)

-- A series of helper functions for rainbowifying the table
-- I decided this was nicer to look at than a bunch of ugly complex lambda expressions
finalHash :: [(Passwd, Passwd)] -> [(Hash, Passwd)]
finalHash list = map hashTouple list

hashAndReduceTouple :: (Passwd, Passwd) -> (Passwd, Passwd)
hashAndReduceTouple (a, b) = (pwReduce (pwHash a), b)

hashTouple :: (Passwd, Passwd) -> (Hash, [Char])
hashTouple (a, b) = (pwHash a, b)

generateTable :: IO ()
generateTable = do
    table <- buildTable rainbowTable nLetters pwLength width height
    writeTable table filename

-- Function 3 - findPassword
findPassword :: Map.Map Hash Passwd -> Int -> Hash -> Maybe Passwd
findPassword table tableWidth hash = findPassword' table tableWidth tableWidth hash hash

-- Aux findPassword function to keep track of the maxWidth and original Hash value
findPassword' :: Map.Map Hash Passwd -> Int -> Int -> Hash -> Hash -> Maybe Passwd
findPassword' _ (-1) _ _ _ = Nothing       -- base case at (-1) because we want to reduce and hash 40 times max
findPassword' table itr maxWidth hash origHash
    | Map.lookup hash table == Nothing      = findPassword' table (itr-1) maxWidth (pwHash(pwReduce hash)) origHash
    | otherwise                             = (case (searchChain maxWidth origHash (Map.lookup hash table)) of 
                                                Nothing -> findPassword' table (itr-1) maxWidth (pwHash(pwReduce hash)) origHash
                                                Just x -> Just x)

-- Search the chain when getting a hit in the rainbow table
searchChain :: Int -> Hash -> Maybe Passwd -> Maybe Passwd
searchChain (-1) _ _ = Nothing
searchChain itr hash password
    | hash == pwHash (fromJust password)        = password
    | otherwise                                 = searchChain (itr-1) hash (Just (pwReduce(pwHash (fromJust password))))

test1 :: IO (Maybe Passwd)
test1 = do
  table <- readTable filename
  return (Map.lookup 0 table)

test2 :: Int -> IO ([Passwd], Int)
test2 n = do
    table <- readTable filename
    pws <- randomPasswords nLetters pwLength n
    let hs = map pwHash pws
    let result = Maybe.mapMaybe (findPassword table width) hs
    return (result, length result)

-- personal test function
-- gets the average percentage of cracked passwords from test2 over n trials
-- can take a while to run as n gets large since running test2 1000 (4-5 seconds each) n times
test3 :: Int -> IO ()
test3 n = do
    totalSum <- (test3' n 0)
    let average = fromIntegral totalSum / fromIntegral (n*1000)
    let percentage = average * 100
    putStrLn (show (percentage :: Float) ++ "% passwords cracked on average over " ++ show (n :: Int) ++ " trials.")

-- runs test2 n times and sums the total amount of cracked passwords
test3' :: Int -> Int -> IO Int
test3' 0 acc = return acc
test3' n acc = do
    (_, successes) <- test2 1000
    finalSum <- (test3' (n-1) (acc+successes))
    return finalSum