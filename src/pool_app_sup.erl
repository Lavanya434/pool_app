-module(pool_app_sup).
-behaviour(supervisor).
-export([start_link/0, init/1]).

start_link() ->
	 Name = ppool,
	 Limit = 10,
 	 MFA = {pool_app_sup, start_link,[]},
	supervisor:start_link(?MODULE, {Name, Limit, MFA}).
 
init({Name, Limit, MFA}) ->
	MaxRestart = 1,
	MaxTime = 3600,
	{ok, {{one_for_all, MaxRestart, MaxTime},[{serv,{pool_app_sup_serv, start_link, [Name, Limit, self(), MFA]},permanent,5000,worker,[pool_app_sup_serv]}]}}.


