-module(exer3).
-export([merge/2, mergeSort/1, isPrimeDay/1, isFriday/1]).

merge([], []) -> [];
merge(X, []) -> X;
merge([], Y) -> Y;
merge([X|XS], [Y|YS]) ->
  case X >= Y of
    true    -> [Y] ++ merge([X] ++ XS, YS);
    false   -> [X] ++ merge(XS, [Y] ++ YS)
  end.

mergeSort([]) -> [];
mergeSort([X]) -> [X];
mergeSort(List) ->
  {A,B} = lists:split(length(List) div 2, List),
  merge(mergeSort(A), mergeSort(B)).

divisors(N) ->
  [I || I <- lists:seq(2, N div 2), N rem I =:= 0].

isPrimeDay(Date) ->
  {_, _, Day} = Date,
  divisors(Day) =:= [].

isFriday(Date) ->
  DayOfTheWeek = calendar:day_of_the_week(Date),
  DayOfTheWeek =:= 5.