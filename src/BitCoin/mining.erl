-module(mining).
-export([main/3]).

main(N,Counter,Pid) ->
  AllowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
  Length = 20,
  _Gs = lists:foldl(fun(_,Acc)->
    [lists:nth(rand:uniform(length(AllowedChars)),AllowedChars)]
    ++Acc
                    end, [], lists:seq(1,Length)),
  _prefix = "dpakanatiserver;",
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
        _Length == 64-N ->
          io:fwrite("String: ~p hash: ~p \n",[_FS,_Substring++_Hash]),
          main(N,Counter+1,Pid);
        true ->
          main(N,Counter+1,Pid)
      end;
    true ->
      Pid!{finished}
  end.



