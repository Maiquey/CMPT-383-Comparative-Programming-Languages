-module(exer2).
-export([divisors/1, primes/1, join/2, pythagorean/1]).

divisors(N) ->
  [I || I <- lists:seq(2, N div 2), N rem I =:= 0].

primes(N) ->
  [I || I <- lists:seq(2, N), divisors(I) =:= []].

join(_, []) -> [];
join(_, [X]) -> X;
join(A, [X|XS]) -> X ++ A ++ join(A, XS).

pythagorean(N) ->
  [{A,B,C} || C <- lists:seq(1, N), A <- lists:seq(1, C), B <- lists:seq(A, C), (A * A)+(B * B)==(C * C)].