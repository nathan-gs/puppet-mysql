class mysql::server inherits mysql::base {
	require mysql::params
	
	package { "mysql-server" : 
		name		=> "${mysql::params::packages_server}",
		ensure		=> present,
	}
	
	service { "mysql" : 
		name		=> "${mysql::params::servicename}",
		ensure		=> running,
		enable		=> true,
		require		=> Package["mysql-server"],
		subscribe	=> File["mysql_conf"],
	}
	
	mysql::config { "server" :
		order		=> '001',
		content		=> template("mysql/server.erb"),
		notify		=> Service["mysql"]
	}

	if ($operationsystem == 'debian') {
		order		=> '700',
		content		=> template("mysql/utf8.erb"),
		notify		=> Service["mysql"]
	}
	
	mysql::config { "utf8" :
		order		=> '700',
		content		=> template("mysql/utf8.erb"),
		notify		=> Service["mysql"]
	}

	
	    mysql::user { "root-localhost" :
            user		=> 'root',
            ensure		=> absent,
            host		=> 'localhost',
            require		=> Service["mysql"]
        }

        mysql::user { "root-127.0.0.1" :
            ensure		=> absent,
            user		=> 'root',
            host		=> '127.0.0.1',
            require		=> Service["mysql"]
        }
	}

	
}