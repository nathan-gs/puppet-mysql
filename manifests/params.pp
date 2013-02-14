class mysql::params(
    $query_client = undef
) {

	$packages_server = $operatingsystem ? {
		/(?i-mx:ubuntu|debian)/		=> 'mysql-server',
		/(?i-mx:centos)/	    	=> 'mysql-server',
	}
	
	$servicename = $operatingsystem ? {
		/(?i-mx:ubuntu|debian)/		=> 'mysql',
		/(?i-mx:centos)/	    	=> 'mysqld',
	}
	
	$packages_client = $operatingsystem ? {
		/(?i-mx:ubuntu|debian)/		=> 'mysql-client',
		/(?i-mx:centos)/	    	=> 'mysql',
	}
	
	$config_file = $operatingsystem ? {
		/(?i-mx:ubuntu|debian)/		=> '/etc/mysql/my.cnf',
		/(?i-mx:centos)/    		=> '/etc/my.cnf',
	}
	
	$config_dir = $operatingsystem ? {
		default						=> '/etc/mysql/conf.d/',
	}
	
	$init_config = $operatingsystem ? {
		/(?i-mx:ubuntu|debian)/		=> '/etc/default/mysql',
		/(?i-mx:centos)/    		=> '/etc/sysconfig/mysqld',
	}

	if($query_client == undef) {
        $mysql_query_client = $operatingsystem ? {
            /(?i-mx:ubuntu|debian)/		=> 'mysql --defaults-file=/etc/mysql/debian.cnf',
        }
	} else {
	    $mysql_query_client = $query_client
	}


	
	$mysql_query_path = '/etc/mysql/query'
}