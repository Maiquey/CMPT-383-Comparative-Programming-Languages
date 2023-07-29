%%% This sample model demonstrates what Erlang does BETTER compared to Haskell, C++, other languages.
%%% This sample demonstrates the simplicity and elegance found in creating concurrent programs using Erlang compared to other languages
%%% like Haskell or C++.
%%% Erlang has extremely simple built-in types (processes, receive, send) for running concurrent programs, while other languages 
%%% would have lots of overhead in setting up thread libraries, etc.
%%% Written with the help of https://learnxinyminutes.com/docs/erlang/ and Erlang documentation
-module(sample2).
-export([spawnPingers/0, countByTwo/1]).

% The infinite counter run by each process spawned
% pings a number every 2 seconds in increments of 2 and declares its Pid using self().
countByTwo(Val) ->
  io:format("PID ~p pinging at ~p!~n", [self(), Val]),
  timer:sleep(2000),
  countByTwo(Val + 2).

% Spawn 2 processes to ping a number every 2 seconds
% spawn them a second apart so that together they count up!
% No breaking mechanism so will just have to ctrl+C to break it
spawnPingers() ->
  spawn(sample2, countByTwo, [1]),
  timer:sleep(1000),
  spawn(sample2, countByTwo, [2]).