-module(pool_app_supersup).
-behaviour(supervisor).

-export([start_link/0, stop/0, start_pool/3, stop_pool/1]).
-export([init/1]).
 
start_link() ->
	supervisor:start_link({local, pool}, ?MODULE, []).

stop() ->
	case whereis(pool) of P
		 when is_pid(P) ->
				exit(P, kill);
				_ -> 
					ok
	end.

init([]) ->
	MaxRestart = 1,
	MaxTime = 3600,
	{ok, {{one_for_one, MaxRestart, MaxTime}, []}}.


start_pool(Name, _Limit, {_M,_F,_A}) ->
	 %%Name = ppool,
	 %%Limit = 10,
 	 %%{M,F,A} = {pool_app_sup, start_link,[]},
	ChildSpec = {Name,{pool_app_sup, start_link, []},permanent, 10500, supervisor, [pool_app_sup]},
	supervisor:start_child(pool, ChildSpec).

stop_pool(Name) ->
	supervisor:terminate_child(pool, Name),
	supervisor:delete_child(pool, Name).