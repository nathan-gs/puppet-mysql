# inspired on example42 mysql module
define mysql::sql (
	$sql,
	$db				= false
) {

	require mysql::params
	
	$sql_hash = sha1($sql)
	
	file { "${mysql::params::mysql_query_path}/${sql_hash}.sql" :
	    mode => 600, owner => root, group => root,
        ensure => present,
        path => "${mysql::params::mysql_query_path}/${sql_hash}.sql",
        content => template('mysql/sql.erb'),
        notify => Exec["mysqlquery-${sql_hash}"],
        require => Service["mysql-server"],
    }
	
	exec { "mysqlquery-${sql_hash}" :
            command => "${mysql::params::mysql_query_client} < ${mysql::params::mysql_query_path}/${sql_hash}.sql",
            require => File["${mysql::params::mysql_query_path}/${sql_hash}.sql"],
            refreshonly => true,
            subscribe => File["${mysql::params::mysql_query_path}/${sql_hash}.sql"],
            path    => [ "/usr/bin" , "/usr/sbin" ],
    }
	
}