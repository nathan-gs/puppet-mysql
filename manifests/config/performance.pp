define mysql::config::performance (
	$table_cache			 	= 256,
	$thread_cache				= 16,
	$table_definition_cache		= 256,
	$max_connections			= 500,
	$query_cache				= '32M',
	$join_buffer_size			= '1M',
	$max_allowed_packet			= '16M',
	$order						= 500
) {
	
	mysql::config { "performance" : 
		content		=> template('mysql/performance.erb),
		order		=> $order,
	}

}