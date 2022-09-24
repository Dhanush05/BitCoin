%%%-------------------------------------------------------------------
%%% @author dhanush
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 24. Sep 2022 1:00 AM
%%%-------------------------------------------------------------------
-module(client).
-author("dhanush").

%% API
-export([connect_to_server/1]).
connect_to_server(ServerNode)->
  net_kernel:start([client,shortnames]),
  erlang:set_cookie(node(),dhanush_cookie),
  net_kernel:connect_node(ServerNode).

