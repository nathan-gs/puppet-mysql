define mysql::config::innodb (
	$use_plugin 	= false,
	$file_per_table	= true,
	$order			= 100
) {

	mysql::config { "innodb" :
		content		=> template('mysql/innodb.erb'),
		order		=> $order,
	}

}