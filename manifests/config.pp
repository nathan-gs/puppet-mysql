# Define : mysql::config
#
#	
define mysql::config ( 
	$ensure = 'present', 
	$content = '',
	$order="500"
	) {
	
	require mysql::params
	
	file {"${mysql::params::config_file}":
		content			=> template('mysql/my.cnf.erb'),
		mode			=> 644,
		owner			=> root,
		group			=> root,
		before			=> Service["mysql-server"],
		ensure			=> present
	}
	
	file { "mysql_conf_dir":
        path    => "${mysql::params::config_dir}",
        mode    => 0644,
        owner   => "root",
        group   => "root",
        ensure  => directory,
    }
	
	file { "${mysql::params::config_dir}/${order}-${name}.cnf":
		ensure => $ensure,
		content => $content,
		mode => 644,
		owner => root,
		group => root,
		notify => Service["mysql-server"],
		before => Service["mysql-server"],
	}
}