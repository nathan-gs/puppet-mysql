define mysql::config::innodb_performance (
	$order						= 500,
	$buffer_pool_size			= '128M',
	$additional_pool_size		= '20M',
	$log_file_size				= '64M',
	$log_buffer_size			= '8M',
	$concurrency				= 0,
	$flush_log_at_trx_commit	= 1,
	$flush_method				= 'O_DIRECT'
	
) {
	mysql::config { "innodb_performance" : 
		content		=> template('mysql/innodb_performance.erb),
		order		=> $order
	}
}