class mysql::client {
	include mysql::params

		
	mysql::config { "client" :
		order		=> '000',
		content		=> template("mysql/client.erb"),
	}
	
    package { "mysql-client":
        name   => "${mysql::params::packages_client}",
        ensure => present,
    }
}
