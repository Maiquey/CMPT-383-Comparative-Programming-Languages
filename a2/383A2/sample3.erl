%%% This sample module demonstrates what Erlang does WORSE compared to Haskell, C++, other languages.
%%% This module offers a fibonacciSequence function which returns a list of the N first fibonacci numbers.
%%% This is a simple but quickly scaling heavy computation.
%%% Although the solution formation is as elegant as seen in Haskell, it is important to note that Erlang does not
%%% excel at tasks which require computation.
%%% Erlang excels at handling a large number of small tasks concurrently, but performs poorly at singular large tasks
%%% In this case, a language like Haskell or C++ will be able to more efficiently make these computations.
-module(sample3).
-export([fibonacciSequence/1]).

% private fibonacci helper finds the Nth fibonacci number (with pattern matching)
fibonacci(1) -> 1;
fibonacci(2) -> 1;
fibonacci(N) -> fibonacci(N - 1) + fibonacci(N - 2).

% recursively define the sequence
fibonacciSequence(0) -> [];
fibonacciSequence(N) -> fibonacciSequence(N - 1) ++ [fibonacci(N)].