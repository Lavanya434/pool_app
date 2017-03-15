{application, 'pool_app', [
	{description, "New project"},
	{vsn, "0.1.0"},
	{modules, ['pool_app_app','pool_app_nagger','pool_app_sup','pool_app_sup_serv','pool_app_sup_sup','pool_app_sup_worker','pool_app_supersup','pool_app_supersup.erl']},
	{registered, [pool_app_sup]},
	{applications, [kernel,stdlib,worker_pool]},
	{mod, {pool_app_app, []}},
	{env, []}
]}.