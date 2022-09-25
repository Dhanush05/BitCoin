%%%-------------------------------------------------------------------
%%% @author dhanush,akhil
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. Sep 2022 11:10 PM
%%%-------------------------------------------------------------------
-module(server).
-author("dhanush").

%% API
-export([start/1,createActors/1,listen/2,term/1]).

createActors(_zeroes)->
  {_,_} = statistics(runtime),
  {_,_} = statistics(wall_clock),
  Pid = spawn(fun()->term(0) end),
  spawn(mining, main, [_zeroes,0,Pid]),
  spawn(mining, main, [_zeroes,0,Pid]),
  spawn(mining, main, [_zeroes,0,Pid]),
  spawn(mining, main, [_zeroes,0,Pid]),
  spawn(mining, main, [_zeroes,0,Pid]),
  spawn(mining, main, [_zeroes,0,Pid]),
  spawn(mining, main, [_zeroes,0,Pid]),
  spawn(mining, main, [_zeroes,0,Pid]),
  spawn(mining, main, [_zeroes,0,Pid]),
  spawn(mining, main, [_zeroes,0,Pid]),
  spawn(mining, main, [_zeroes,0,Pid]),
  spawn(mining, main, [_zeroes,0,Pid]),
  spawn(mining, main, [_zeroes,0,Pid]),
  spawn(mining, main, [_zeroes,0,Pid]),
  spawn(mining, main, [_zeroes,0,Pid]),
  spawn(mining, main, [_zeroes,0,Pid]).


listen(_zeroes,_Pid) ->
  receive
    {reached_main,_String,_Hash}->
      io:fwrite("String: ~p and hash generated: ~p \n",[_String, _Hash]),
      listen(_zeroes,_Pid);
    {ping,_Ping_ID}->
      _Ping_ID!{nval, _zeroes,_Pid},
      listen(_zeroes,_Pid)
  end.

start(_zeroes) ->
  {_,_} = statistics(runtime),
  {_,_} = statistics(wall_clock),
  _Pid = spawn(fun()->term(0) end),
  register(serverpid, spawn(server, listen, [_zeroes,_Pid])).

term(CoresDone) ->
  %Cores = erlang:system_info(logical_processors_available),
  %io:fwrite("TOTAL AVAILABLE CORES ARE ~p",[Cores]),
  if
    CoresDone == 16->
      {_,T1} = statistics(runtime),
      {_,T2} = statistics(wall_clock),
      CPU_time = T1/ 1000,
      Run_time = T2 / 1000,
      T3 = CPU_time / Run_time,
      io:format("CPU time: ~p seconds\n", [CPU_time]),
      io:format("Real time: ~p seconds\n", [Run_time]),
      io:format("Ratio is ~p \n", [T3]);

    true ->
      receive
        {finished} ->
%%          io:fwrite("Core Computed! Core Count ~p~n",[CoresDone]),
          term(CoresDone+1);
        Other ->
          ok
      end
  end.

