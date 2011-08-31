class mysql::base {

	require mysql::params
	
	file { "mysql_conf":
        path    => "${mysql::params::config_file}",
        mode    => "644",
        owner   => "root",
        group   => "root",
        ensure  => present,
        content => template("mysql/my.cnf.erb"),
    }
	
	file { "mysql_conf_dir":
        path    => "${mysql::params::config_dir}",
        mode    => 0644,
        owner   => "root",
        group   => "root",
        ensure  => directory,
    }
	
}