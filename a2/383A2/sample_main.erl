-module(sample_main).
-export([start/0, concurrencyTest/0]).

start() ->
  io:format(">> firstNIndices(5, 3, [1,2,2,1,4,7,1,3,7,1,3,7,8,2,3])~n~p~n", [sample1:firstNIndices(5, 3, [1,2,2,1,4,7,1,3,7,1,3,7,8,2,3])]),
  io:format(">> firstNIndices(1, 3, [1,2,2,1,4,7,1,3,7,1,3,7,8,2,3])~n~p~n", [sample1:firstNIndices(1, 3, [1,2,2,1,4,7,1,3,7,1,3,7,8,2,3])]),
  io:format(">> firstNIndices(3, 3, [1,2,2,1,4,7,1,3,7,1,3,7,8,2,3])~n~p~n", [sample1:firstNIndices(3, 3, [1,2,2,1,4,7,1,3,7,1,3,7,8,2,3])]),
  io:format(">> firstNIndices(0, 1, [1,2,2,1,4])~n~p~n", [sample1:firstNIndices(0, 1, [1,2,2,1,4])]),
  io:format(">> firstNIndices(5, 1, [])~n~p~n", [sample1:firstNIndices(5, 1, [])]),
  io:format(">> fibonacciSequence(0)~n~p~n", [sample3:fibonacciSequence(0)]),
  io:format(">> fibonacciSequence(1)~n~p~n", [sample3:fibonacciSequence(1)]),
  io:format(">> fibonacciSequence(5)~n~p~n", [sample3:fibonacciSequence(5)]),
  io:format(">> fibonacciSequence(10)~n~p~n", [sample3:fibonacciSequence(10)]),
  io:format(">> fibonacciSequence(25)~n~p~n", [sample3:fibonacciSequence(25)]).

concurrencyTest() ->
  sample2:spawnPingers().