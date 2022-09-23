%%%-------------------------------------------------------------------
%%% @author dhanush
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. Sep 2022 2:06 AM
%%%-------------------------------------------------------------------
-module(logic).
-author("dhanush").

%% API
-export([main/0]).

main() ->
  AllowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
  Length = 20,
  _Gs = lists:foldl(fun(_,Acc)->
    [lists:nth(rand:uniform(length(AllowedChars)),AllowedChars)]
    ++Acc
                    end, [], lists:seq(1,Length)),
  _prefix = "dpakanati;",
  _FS = _prefix++_Gs,
  _BinaryCypher = crypto:hash(sha256,"dpakanati;luq8Ojymts2hG8cE76k4"),
  _IntegerCypher = binary:decode_unsigned(_BinaryCypher,big),
  _Value = io_lib:format("~64.16.0b",[_IntegerCypher]),
  _Substring = string:substr(_Value,1,4),
  _Hash = integer_to_list(_IntegerCypher,16),
  _Length = string:length(_Hash),
  %%if length is count of coins: stop all process.
  %%else: continue mining.
  if
    _Length ==60 ->
      io:fwrite("String: ~p hash: ~p \n",[_FS,_Substring++_Hash]);
%%      ,Mid!{reached_main,N};
%%      ,main(N,Mid);
    true ->
      main()
  end.

