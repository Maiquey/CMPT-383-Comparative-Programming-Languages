import Data.Ratio

myIterate :: (a -> a) -> a -> [a]
myIterate f x = [x] ++ myIterate f (f x)

mySplitAt :: Int -> [a] -> ([a], [a])
mySplitAt 0 x = ([], x)
mySplitAt ind (x:xs) = ([x] ++ split, rest)
    where (split, rest) = mySplitAt (ind-1) xs

rationalSum :: Int -> [Ratio Int]
rationalSum n = [x % (n-x) | x <- [1..(n-1)]]

rationalSumLowest :: Int -> [Ratio Int]
rationalSumLowest n = [x % (n-x) | x <- [1..(n-1)], gcd x (n-x) == 1]

rationals = [x | i <-[1..], x <- rationalSumLowest i]

sumFile :: IO ()
sumFile = do
    str <- readFile "input.txt"
    let numStr = splitAtSeparator '\n' str
    let nums = map readInt numStr
    let sum = show (sumList nums)
    putStrLn sum

sumList :: [Int] -> Int
sumList x = foldl (+) 0 x

-- split a list around a given separator value
splitAtSeparator :: Eq a => a -> [a] -> [[a]]
splitAtSeparator sep [] = []
splitAtSeparator sep content = first : splitAtSeparator sep rest
    where
    first = takeWhile (/= sep) content
    firstlen = length first
    rest = drop (firstlen+1) content

-- convert an integer-like string to an integer
readInt :: String -> Int
readInt = read