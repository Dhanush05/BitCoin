%%%-------------------------------------------------------------------
%%% @author dhanush
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. Sep 2022 11:10 PM
%%%-------------------------------------------------------------------
-module(server).
-author("dhanush").

%% API
-export([start/1,createActors/2,receiver/1]).

createActors(Mid,_zeroes)->
  receive
    {create_actors}->
      io:fwrite("~p~n",[self()]),
      spawn(mining, main, ["4",Mid]),
      spawn(mining, main, ["4",Mid]),
      spawn(mining, main, ["3",Mid]),
      spawn(mining, main, ["4",Mid]);
    {remote_actor}->
      io:fwrite("received msg from remote actor")
  end.

receiver(0)->
  io:fwrite("");
receiver(N)->
  receive
    {reached_main,Num}->
%%      io:fwrite("\Hash received from main ~w\n",[N])
      io:fwrite("")
  end,
  receiver(N-1).

start(_zeroes) ->
%%  net_kernel:start([server,shortnames]),
%%  erlang:set_cookie(node(),dhanush_cookie),
%%  register(servpid, spawn(server, listen, [Zeroes])),
  Mid = spawn(server, createActors, [self(),_zeroes]),
  io:fwrite("~p~n",[self()]),
  io:fwrite("Master id is: ~w \n",[Mid]),
  Mid!{create_actors},
  receiver(3).


