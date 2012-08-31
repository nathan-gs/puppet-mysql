define mysql::database (
	$ensure		= 'present'
) {

	
	case $ensure {
		'present': {
		    notice("Creating database: ${name}")
			mysql::sql { "CREATE DATABASE IF NOT EXISTS `${name}` CHARACTER SET utf8 COLLATE utf8_general_ci": }
		}
		'absent': {
		    notice("Dropping database: ${name}")
			mysql::sql { "DROP DATABASE IF EXISTS `${name}`": }
		}
		default: { fail("Unrecognized 'ensure' param for mysql::database'") }
	}


}
