%%%-------------------------------------------------------------------
%%% @author dhanush, akhil
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 24. Sep 2022 1:00 AM
%%%-------------------------------------------------------------------
-module(client).
-author("dhanush").

%% API
-export([mine/4,ping/1]).
ping(Node)->
  {serverpid,Node}!{ping,self()},
  receive
    {nval,N,_Pid}->
      io:format("N received"),
      spawn(client, mine,[N,Node,0,_Pid]),
      spawn(client, mine,[N,Node,0,_Pid]),
      spawn(client, mine,[N,Node,0,_Pid]),
      spawn(client, mine,[N,Node,0,_Pid]),
      spawn(client, mine,[N,Node,0,_Pid]),
      spawn(client, mine,[N,Node,0,_Pid]),
      spawn(client, mine,[N,Node,0,_Pid]),
      spawn(client, mine,[N,Node,0,_Pid]),
      spawn(client, mine,[N,Node,0,_Pid]),
      spawn(client, mine,[N,Node,0,_Pid]),
      spawn(client, mine,[N,Node,0,_Pid]),
      spawn(client, mine,[N,Node,0,_Pid]),
      spawn(client, mine,[N,Node,0,_Pid]),
      spawn(client, mine,[N,Node,0,_Pid]),
      spawn(client, mine,[N,Node,0,_Pid]),
      spawn(client, mine,[N,Node,0,_Pid])
  end.
%%  end.

mine(N,Node,Counter,_Pid) ->
  AllowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
  Length = 20,
  _Gs = lists:foldl(fun(_,Acc)->
    [lists:nth(rand:uniform(length(AllowedChars)),AllowedChars)]
    ++Acc
                    end, [], lists:seq(1,Length)),
  _prefix = "dpakanaticlient;",
  _FS = _prefix++_Gs,
  _BinaryCypher = crypto:hash(sha256,_FS),
  _IntegerCypher = binary:decode_unsigned(_BinaryCypher,big),
  _Value = io_lib:format("~64.16.0b",[_IntegerCypher]),
  _Substring = string:substr(_Value,1,4),
  _Hash = integer_to_list(_IntegerCypher,16),
  _Length = string:length(_Hash),
  if
    Counter=<100000 ->
      if
        _Length ==64-N ->
          io:fwrite("String: ~p hash: ~p \n",[_FS,_Substring++_Hash]),
          {serverpid,Node}!{reached_main,_FS,_Value},
          mine(N,Node,Counter+1,_Pid);
        true ->
          mine(N,Node,Counter+1,_Pid)
      end;
    true ->
      ok
%%      _Pid!{finished}
  end.
