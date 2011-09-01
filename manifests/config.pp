# Define : mysql::config
#
#	
define mysql::config ( 
	$ensure = 'present', 
	$content = '',
	$order="500"
	) {
	
	require mysql::params
	
	file { "${mysql::params::config_dir}/${order}-${name}.cnf":
		ensure => $ensure,
		content => $content,
		mode => 644,
		owner => root,
		group => root,
		notify	=> Service["mysql"]
	}
}