import Data.Time.Calendar
import Data.Time.Calendar.OrdinalDate

merge :: Ord a => [a] -> [a] -> [a]
merge ([]) ([]) = []
merge x ([]) = x
merge ([]) y = y
merge (x:xs) (y:ys)
    | x >= y        = [y] ++ merge ([x] ++ xs) ys
    | x < y         = [x] ++ merge xs ([y] ++ ys)

mergeSort :: Ord a => [a] -> [a]
mergeSort ([]) = []
mergeSort (x:[]) = [x]
mergeSort list = merge (mergeSort a) (mergeSort b)
    where (a,b) = splitAt (length list `div` 2) list

daysInYear :: Integer -> [Day]
daysInYear y = [jan1..dec31]
  where jan1 = fromGregorian y 1 1
        dec31 = fromGregorian y 12 31

isFriday :: Day -> Bool
isFriday day = (weekDay == 5)
    where weekDay = snd (mondayStartWeek day)

divisors :: Int -> [Int]
divisors n = [i | i <- [2..(n `div` 2)], n `mod` i == 0]

isPrimeDay :: Day -> Bool
isPrimeDay day = (divisors dayNumber == [])
    where (year, month, dayNumber) = toGregorian day

primeFridays :: Integer -> [Day]
primeFridays y = [i | i <- daysInYear (y), isFriday (i), isPrimeDay(i)]
