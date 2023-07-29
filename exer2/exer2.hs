divisors :: Int -> [Int]
divisors n = [i | i <- [2..(n `div` 2)], n `mod` i == 0]
primes :: Int -> [Int]
primes n = [i | i <- [2..n], divisors i == []]

pythagorean :: Int -> [(Int, Int, Int)]
pythagorean n = [(a,b,c) | c <- [1..n], a <- [1..c], b <- [a..c], (a^2)+(b^2)==(c^2)]

join :: [Char] -> [[Char]] -> [Char]
join _ ([]) = []
join _ (x:[]) = x
join a (x:xs) = x ++ a ++ join a xs

fact' :: Int -> Int
fact' n = foldl (*) 1 [1..n]

hailstone n
    | even n        = div n 2
    | otherwise     = 3 * n + 1

hailLen n = hailTail 0 n
  where
    hailTail a 1 = a
    hailTail a x = hailTail (a+1) (hailstone x)