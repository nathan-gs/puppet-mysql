define mysql::user (
	$password		= '',
	$is_encrypted	= false,
	$privileges 	= 'USAGE',
	$host			= 'localhost',
	$db				= '*.*',
	$ensure			= 'present'
) {

	require mysql::params
	
	$template = $ensure ? {
	 'present'      => template('mysql/user_create.sql.erb'),
	 'absent'		=> template('mysql/user_delete.sql.erb')
	}
	
	mysql::sql { "${ensure}-${name}-${host}-${db}" :
		template	=> $template
	}
}