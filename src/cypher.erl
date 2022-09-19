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
-export([main/0]).
main()->
  createHash("string example").

createHash(_A)->
  _BinaryCypher = crypto:hash(sha256,_A),
  _IntegerCypher = binary:decode_unsigned(_BinaryCypher),
  _Hash = integer_to_list(_IntegerCypher,16),
  _Hash.
%%io_lib:format("String is ~64.16.0b",[_IntegerCypher]).

