%%% This sample module program has a public interface of 1 function: firstNIndices(N, Target, List)
%%% This function returns up to the first N indices of instances of Target in List
%%% -spec are shown for each function. This is similar to type signature in Haskell but only functions as documentation unless Dialyzer is run.
-module(sample1).
-export([firstNIndices/3]).

%This program returns a list of indices indicating up to the first N locations of the target integer from a list of integers if they exist
%type signature, output can be list of ints or atoms
-spec firstNIndices(integer(), integer(), [integer()]) -> [integer()].
firstNIndices(N, Target, List) ->
  findIndices(0, N, Target, List). %call helper

%Perform pattern matching to symbolize base cases
%Return empty list if all instances of Target are found or reached end of list
-spec findIndices(integer(), integer(), integer(), [integer()]) -> [integer()].
findIndices(_, _, _, []) -> []; % If N larger than num of matching targets
findIndices(_, 0, _, _) -> []; % If N targets found
findIndices(Position, Remaining, Target, [Element|Rest]) -> % Recursive Case
  case Target =:= Element of
    true    -> [Position] ++ findIndices(Position + 1, Remaining - 1, Target, Rest);
    false   -> findIndices(Position + 1, Remaining, Target, Rest)
  end.