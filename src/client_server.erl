%%%-------------------------------------------------------------------
%%% @author dhanush
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. Sep 2022 2:05 AM
%%%-------------------------------------------------------------------
-module(client_server).
-author("dhanush").

%% API
-export([start/0,stop/0,mining/0,addactor/0]).
start()->
  test_server:start_link().
stop()->
  test_server:stop().
mining()->
  test_server:bitcoin().
addactor()->
  test_server:startactors().
