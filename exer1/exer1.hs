det a b c = b^2 - 4*a*c
quadsol1 a b c = (-b - sqrt (det a b c))/2*a
quadsol2 a b c = (-b + sqrt (det a b c))/2*a

third_a x = x !! 2

third_b (_:_:x:_) = x 

fact 0 = 1
fact x = x * fact (x - 1)

hailstone n
    | even n        = div n 2
    | otherwise     = 3 * n + 1

hailLen 1 = 0
hailLen x = 1 + hailLen (hailstone x)