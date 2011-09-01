class mysql::server inherits mysql::base {
	require mysql::params
	
	package { "mysql-server" : 
		name		=> "${mysql::params::packages_server}",
		ensure		=> present,
	}
	
	service { "mysql-server" : 
		name		=> "${mysql::params::servicename}",
		ensure		=> running,
		enable		=> true,
		require		=> Package["mysql-server"],
		subscribe	=> File["mysql_conf"],
	}
	
	mysql::config { "server" :
		order		=> '001',
		content		=> template("mysql/server.erb"),
		notify		=> Service["mysql-server"]
	}
	
	mysql::user { "root-localhost" :
		user		=> 'root',
		ensure		=> absent,
		host		=> 'localhost',
		require		=> Service["mysql-server"]
	}
	
	mysql::user { "root-127.0.0.1" :
		ensure		=> absent,
		user		=> 'root',
		host		=> '127.0.0.1',
		require		=> Service["mysql-server"]
	}
	
}