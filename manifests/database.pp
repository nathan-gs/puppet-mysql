define mysql::database (
	$ensure		= 'present',
) {
	
	$sql = $ensure ? {
	 'present'      => 'CREATE DATABASE ${name} IF NOT EXISTS',
	 'absent'		=> 'DROP DATABASE ${name} IF EXISTS'
	}
	
	mysql::sql { $sql }

}