pascal :: Int -> [Int]
pascal 0 = [1]
pascal x = [1] ++ (map (uncurry (+)) (zip (init prev) (tail prev))) ++ [1]
    where prev = pascal (x-1)

addPair :: Num a => (a, a) -> a
addPair = uncurry (+)

withoutZeros :: (Eq a, Num a) => [a] -> [a]
withoutZeros = filter (/= 0)

findElt :: Eq a => a -> [a] -> Maybe Int
findElt target ([]) = Nothing
findElt target (x:xs)
    | x == target     = Just 0
    | otherwise       = (case (findElt target xs) of 
                        Nothing -> Nothing
                        Just x -> Just (x + 1))