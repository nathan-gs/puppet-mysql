define mysql::user (
	$user			= '',
	$password		= '',
	$is_encrypted	= false,
	$privileges 	= 'USAGE',
	$host			= 'localhost',
	$db				= '*.*',
	$ensure			= 'present'
) {

	require mysql::params
	
	$real_user = $user ? {
		''			=> $name,
		default		=> $user
	}
	
	$template = $ensure ? {
	 'present'      => template('mysql/user_create.sql.erb'),
	 'absent'		=> template('mysql/user_delete.sql.erb')
	}
	
	mysql::sql { "${ensure}-${real_user}-${host}-${db}" :
		template	=> $template
	}
}