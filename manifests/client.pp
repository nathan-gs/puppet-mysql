class mysql::client {
	include mysql::params

    package { "mysql-client":
        name   => "${mysql::params::packages_client}",
        ensure => present,
    }
}
