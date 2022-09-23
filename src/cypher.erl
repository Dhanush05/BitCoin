%%%-------------------------------------------------------------------
%%% @author dhanush,akhil
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
  hashGenerator(20,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890").

hashGenerator(Length, AllowedChars)->
  _Gs = lists:foldl(fun(_,Acc)->
    [lists:nth(rand:uniform(length(AllowedChars)),AllowedChars)]
      ++Acc
    end, [], lists:seq(1,Length)),
  _prefix = "dpakanati;",
  _FS = _prefix++_Gs,
  _BinaryCypher = crypto:hash(sha256,_FS),
  _IntegerCypher = binary:decode_unsigned(_BinaryCypher,big),
%%  _Value = io:fwrite("String is ~64.16.0b  ",[_IntegerCypher]),
  _Hash = integer_to_list(_IntegerCypher,16),
  _Length = string:length(_Hash),
  %%if length is count of coins: stop all process.
  %%else: continue mining.
  if
    _Length ==59 ->
      io:fwrite("String: ~p hash: ~p \n",[_FS,"00000"++_Hash]);
    true ->
      main(1)
  end.

createActors()->
  %%parameter as count
  F = fun(X)->
    timer: sleep(10),
    main(1)
      end,
  [spawn(fun()->F(X) end)||X<-lists:seq(1,4)],
  %%Function = spawn(Cypher, main,[1]),
  statistics(runtime).

%%counter()->
%%  N = 10,
%%

%%  _zerocount  = string:sub_string(_Hash,1,1),
%%  checkCoin(_zerocount).
%%checkCoin(_zeros) when _zeros /= "0"->
%%  main(2).
%%io_lib:format("String is ~64.16.0b",[_IntegerCypher]).

