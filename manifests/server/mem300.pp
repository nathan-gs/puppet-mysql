class mysql::server::mem300 {
	require mysql::server
	
	mysql::config::innodb{ "300m_inno" :
	}
	
	mysql::config::innodb_performance { "300m_inno_p":
		buffer_pool_size			=> '180M',
	}
	
	mysql::config::performance { "300m_performance" : 
		table_cache					=> 2500,
		query_cache					=> '100M',
	}
}