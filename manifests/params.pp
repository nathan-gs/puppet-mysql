class mysql::params {

	$packages_server = $operatingsystem ? {
		/(?i-mx:ubuntu|debian)/		=> 'mysql-server',
	}
	
	$servicename = $operatingsystem ? {
		/(?i-mx:ubuntu|debian)/		=> 'mysql',
	}
	
	$packages_client = $operatingsystem ? {
		/(?i-mx:ubuntu|debian)/		=> 'mysql-client',
	}
	
	$config_file = $operatingsystem ? {
		/(?i-mx:ubuntu|debian)/		=> '/etc/mysql/my.cnf',
	}
	
	$config_dir = $operatingsystem ? {
		default						=> '/etc/mysql/conf.d/',
	}
	
	$init_config = $operatingsystem ? {
		/(?i-mx:ubuntu|debian)/		=> '/etc/default/mysql',
	}
	
	$mysql_query_client = $operatingsystem ? {
		/(?i-mx:ubuntu|debian)/		=> 'mysql --defaults-file=/etc/mysql/debian.cnf',
	}
	
	$mysql_query_path = '/etc/mysql/query'
}