# inspired on example42 mysql module
define mysql::sql (
	$db				= false,
	$template		= ''
) {

	$sql = $name
	
	require mysql::params
	require mysql::client
	
	$real_template = $template ? { 
			''			=> template('mysql/sql.erb'),
	    	default		=> $template,
	  	}
	
	
	$sql_hash = sha1($sql)
	
	file { "${mysql::params::mysql_query_path}/${sql_hash}.sql" :
	    mode => 600, owner => root, group => root,
        ensure => present,
        path => "${mysql::params::mysql_query_path}/${sql_hash}.sql",
        content => $real_template,
        notify => Exec["mysqlquery-${sql_hash}"],
        require => [Service["mysql"], [File["${mysql::params::mysql_query_path}"]]],
    }
	
	exec { "mysqlquery-${sql_hash}" :
            command => "${mysql::params::mysql_query_client} < ${mysql::params::mysql_query_path}/${sql_hash}.sql",
            require => [File["${mysql::params::mysql_query_path}/${sql_hash}.sql"],Package["mysql-client"]],
            refreshonly => true,
            subscribe => File["${mysql::params::mysql_query_path}/${sql_hash}.sql"],
            path    => [ "/usr/bin" , "/usr/sbin" ],
    }
	
}