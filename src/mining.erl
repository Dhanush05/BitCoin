-module(mining).
-export([main/2]).

main(N,Mid) ->
  AllowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
  Length = 20,
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
    _Length ==60 ->
      io:fwrite("String: ~p hash: ~p \n",[_FS,"0000"++_Hash]),Mid!{reached_main,N};
%%      ,main(N,Mid);
    true ->
      main(N,Mid)
  end.


