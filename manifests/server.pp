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
	
	mysql::config( "server" :
		order		=> '000',
		content		=> template("mysql/server.erb")
	)
	
}