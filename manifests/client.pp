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
	
	file { "${mysql::params::mysql_query_path}" :
		mode	=> 700,
		ensure	=> directory,
		owner	=> root,
		group	=> root
	}
	
}
