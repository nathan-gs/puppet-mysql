define mysql::database (
	$ensure		= 'present'
) {
	
	$sql = $ensure ? {
	 'present'      => "CREATE DATABASE IF NOT EXISTS `${name}`",
	 'absent'		=> "DROP DATABASE IF EXISTS `${name}`"
	}
	
	mysql::sql { $sql:
		
	}

}