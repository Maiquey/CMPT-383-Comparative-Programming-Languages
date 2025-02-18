-module(main).
-export([start/0]).

start() ->
  io:format("Exercise Re-implementations~n~n"),
  io:format(">> divisors(30)~n~p~n", [exer2:divisors(30)]),
  io:format(">> divisors(64)~n~p~n", [exer2:divisors(64)]),
  io:format(">> divisors(127)~n~p~n", [exer2:divisors(127)]),
  io:format(">> primes(7)~n~p~n", [exer2:primes(7)]),
  io:format(">> primes(100)~n~p~n", [exer2:primes(100)]),
  io:format(">> join(\", \", [\"one\", \"two\", \"three\"])~n~p~n", [exer2:join(", ", ["one", "two", "three"])]),
  io:format(">> join(\"+\", [\"1\", \"2\", \"3\"])~n~p~n", [exer2:join("+", ["1", "2", "3"])]),
  io:format(">> join(\"X\", [\"abc\"])~n~p~n", [exer2:join("X", ["abc"])]),
  io:format(">> join(\"X\", [])~n~p~n", [exer2:join("X", [])]),
  io:format(">> pythagorean(10)~n~p~n", [exer2:pythagorean(10)]),
  io:format(">> pythagorean(30)~n~p~n", [exer2:pythagorean(30)]),
  io:format(">> merge([2,4,6,8], [1,3,5,7])~n~p~n", [exer3:merge([2,4,6,8], [1,3,5,7])]),
  io:format(">> merge([1,2,3,4], [5,6,7,8,9,10])~n~p~n", [exer3:merge([1,2,3,4], [5,6,7,8,9,10])]),
  io:format(">> merge([4,5,7,8], [1,2,3,6,9])~n~p~n", [exer3:merge([4,5,7,8], [1,2,3,6,9])]),
  io:format(">> merge(\"aeguz\", \"ceptw\")~n~p~n", [exer3:merge("aeguz", "ceptw")]),
  io:format(">> mergeSort([1,9,3,2,7,6,4,8,5])~n~p~n", [exer3:mergeSort([1,9,3,2,7,6,4,8,5])]),
  io:format(">> mergeSort([6,2,4,8,9,5,3,1,7,10])~n~p~n", [exer3:mergeSort([6,2,4,8,9,5,3,1,7,10])]),
  io:format(">> mergeSort([])~n~p~n", [exer3:mergeSort([])]),
  io:format(">> mergeSort([4])~n~p~n", [exer3:mergeSort([4])]),
  io:format(">> mergeSort(\"The quick brown fox jumps over the lazy dog.\")~n~p~n", [exer3:mergeSort("The quick brown fox jumps over the lazy dog.")]),
  io:format(">> isFriday({2018, 5, 17})~n~p~n", [exer3:isFriday({2018, 5, 17})]),
  io:format(">> isFriday({2018, 5, 18})~n~p~n", [exer3:isFriday({2018, 5, 18})]),
  io:format(">> isPrimeDay({2018, 5, 13})~n~p~n", [exer3:isPrimeDay({2018, 5, 13})]),
  io:format(">> isPrimeDay({2018, 5, 14})~n~p~n", [exer3:isPrimeDay({2018, 5, 14})]),
  io:format(">> isPrimeDay({2018, 5, 23})~n~p~n", [exer3:isPrimeDay({2018, 5, 23})]).
