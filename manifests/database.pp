define mysql::database (
	$ensure		= 'present'
) {
	
	$sql = $ensure ? {
	 'present'      => "CREATE DATABASE IF NOT EXISTS `${name}` CHARACTER SET utf8 COLLATE utf8_general_ci",
	 'absent'		=> "DROP DATABASE IF EXISTS `${name}`"
	}
	
	mysql::sql { $sql:
		
	}

}