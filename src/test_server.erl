%%%-------------------------------------------------------------------
%%% @author dhanush
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. Sep 2022 2:05 AM
%%%-------------------------------------------------------------------
-module(test_server).
-author("dhanush").

-behaviour(gen_server).

%% API
-export([start_link/0,stop/0,bitcoin/0,startactors/1]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2,
         code_change/3]).


-define(SERVER, ?MODULE).

-record(test_server_state, {}).

%%%===================================================================
%%% API
%%%===================================================================
%%%
%%CLIENT CALLS%%
%%%

%% @doc Spawns the server and registers the local name (unique)
-spec(start_link() ->
    {ok, Pid :: pid()} | ignore | {error, Reason :: term()}).
start_link() ->
    gen_server:start_link({global, ?MODULE}, ?MODULE, [], []).
stop()->
  gen_server:cast({global,?MODULE},stop).
bitcoin()->
  gen_server:call({global,?MODULE},{minecoin}).
startactors(_count)->
    gen_server:call({global,?MODULE},{startactors,_count}).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

%% @private
%% @doc Initializes the server
-spec(init(Args :: term()) ->
    {ok, State :: #test_server_state{}} | {ok, State :: #test_server_state{}, timeout() | hibernate} |
    {stop, Reason :: term()} | ignore).
init([]) ->
    {ok, #test_server_state{}}.

%% @private
%% @doc Handling call messages
-spec(handle_call(Request :: term(), From :: {pid(), Tag :: term()},
        State :: #test_server_state{}) ->
    {reply, Reply :: term(), NewState :: #test_server_state{}} |
    {reply, Reply :: term(), NewState :: #test_server_state{}, timeout() | hibernate} |
    {noreply, NewState :: #test_server_state{}} |
    {noreply, NewState :: #test_server_state{}, timeout() | hibernate} |
    {stop, Reason :: term(), Reply :: term(), NewState :: #test_server_state{}} |
    {stop, Reason :: term(), NewState :: #test_server_state{}}).
handle_call({minecoin}, _From, State) ->
    {reply, logic:main(), State};
handle_call({startactors,_count},_From,State)->
    {reply, server:start(_count),State}.

%% @private
%% @doc Handling cast messages
-spec(handle_cast(Request :: term(), State :: #test_server_state{}) ->
    {noreply, NewState :: #test_server_state{}} |
    {noreply, NewState :: #test_server_state{}, timeout() | hibernate} |
    {stop, Reason :: term(), NewState :: #test_server_state{}}).
handle_cast(_Request, State = #test_server_state{}) ->
    {noreply, State}.

%% @private
%% @doc Handling all non call/cast messages
-spec(handle_info(Info :: timeout() | term(), State :: #test_server_state{}) ->
    {noreply, NewState :: #test_server_state{}} |
    {noreply, NewState :: #test_server_state{}, timeout() | hibernate} |
    {stop, Reason :: term(), NewState :: #test_server_state{}}).
handle_info(_Info, State = #test_server_state{}) ->
    {noreply, State}.

%% @private
%% @doc This function is called by a gen_server when it is about to
%% terminate. It should be the opposite of Module:init/1 and do any
%% necessary cleaning up. When it returns, the gen_server terminates
%% with Reason. The return value is ignored.
-spec(terminate(Reason :: (normal | shutdown | {shutdown, term()} | term()),
        State :: #test_server_state{}) -> term()).
terminate(_Reason, _State = #test_server_state{}) ->
    ok.

%% @private
%% @doc Convert process state when code is changed
-spec(code_change(OldVsn :: term() | {down, term()}, State :: #test_server_state{},
        Extra :: term()) ->
    {ok, NewState :: #test_server_state{}} | {error, Reason :: term()}).
code_change(_OldVsn, State = #test_server_state{}, _Extra) ->
    {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
