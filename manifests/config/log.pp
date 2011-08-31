define mysql::config::log (
	$log					 	= '/var/log/mysql/mysql-slow.log',
	$long_query_time			= 30,
	$not_using_indexes			= true
) {
	
	mysql::config { "log" : 
		content		=> template('mysql/log.erb'),
		order		=> $order,
	}

}