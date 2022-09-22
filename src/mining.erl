%%%-------------------------------------------------------------------
%%% @author dhanush
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. Sep 2022 10:44 PM
%%%-------------------------------------------------------------------
-module(mining).
-author("dhanush").

%% API
-export([main/0,bitcoin/0,createActors/1]).

main()->
  receive
    send_message->
      Length = 20,
      AllowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
      _GS = lists:foldl(fun(_,Acc)->
        [lists:nth(rand:uniform(length(AllowedChars)),AllowedChars)]
        ++Acc
                        end, [], lists:seq(1,Length)),
      _prefix = "dpakanati",
      _GS,
      _FS = _prefix ++ _GS,
      _BinaryCypher = crypto:hash(sha256,_FS),
      _IntegerCypher = binary:decode_unsigned(_BinaryCypher,big),
      _Hash = integer_to_list(_IntegerCypher,16),
      _Length = string:length(_Hash),
      if
        _Length == 60 ->
          io:fwrite("String: ~p hash: ~p \n",[_FS,"0000"++_Hash]);
        true ->
          main()
      end
  end.

createActors(Pid)->
  Pid!send_message.


bitcoin()->
  Pid = spawn(mining, main,[]),
  spawn(mining, createActors,[Pid]).





