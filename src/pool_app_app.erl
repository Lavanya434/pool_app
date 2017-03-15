-module(pool_app_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).
-export([start_pool/3,stop_pool/1,run/2,async_queue/2,sync_queue/2]).

start(normal, _Args) ->
	pool_app_supersup:start_link().

stop(_State) ->
	ok.

start_pool(Name, Limit, {M,F,A}) ->
	pool_app_supersup:start_pool(Name, Limit, {M,F,A}).
 
stop_pool(Name) ->
	pool_app_supersup:stop_pool(Name).
 
run(Name, Args) ->
	pool_app_sup_serv:run(Name, Args).
 
async_queue(Name, Args) ->
	pool_app_sup_serv:async_queue(Name, Args).
 
sync_queue(Name, Args) ->
	pool_app_sup_serv:sync_queue(Name, Args).
