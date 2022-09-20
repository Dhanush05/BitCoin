%%%-------------------------------------------------------------------
%%% @author dhanush
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. Sep 2022 12:33 AM
%%%-------------------------------------------------------------------
-module('cypher').
-author("dhanush").

%% API
-export([main/1,createActors/0]).
main(K)->
  stringGenerator(12,"qwertyQWERTY1234567890").

stringGenerator(Length, AllowedChars)->
  _Gs = lists:foldl(fun(_,Acc)->
    [lists:nth(random:uniform(length(AllowedChars)),AllowedChars)]
      ++Acc
    end, [], lists:seq(1,Length)),
  _prefix = "dpakanati;",
  _Test = "shubhamagiwal92;24018048",
  _FS = _prefix++_Gs,
  createHash(_FS).

createHash(_A)->
  _BinaryCypher = crypto:hash(sha256,_A),
  _IntegerCypher = binary:decode_unsigned(_BinaryCypher),
  _Hash = integer_to_list(_IntegerCypher,16),
  %%io:fwrite(" Hash length is  ~w \n", [string:length(_Hash)]),
  _Length = string:length(_Hash),
  if
    _Length ==60 -> io:fwrite("String: ~p hash: ~p \n",[_A,"0000"++_Hash]);
    true -> main(1)
  end.

createActors()->
  F = fun(X)-> timer: sleep(10), main(1) end,
  [spawn(fun()->F(X)end)||X<-lists:seq(1,10)].








%%  _zerocount  = string:sub_string(_Hash,1,1),
%%  checkCoin(_zerocount).
%%checkCoin(_zeros) when _zeros /= "0"->
%%  main(2).


%%io_lib:format("String is ~64.16.0b",[_IntegerCypher]).

