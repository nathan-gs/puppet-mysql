class mysql::server::mem2500 {
	require mysql::server
	
	mysql::config::innodb{ "2500m_inno" :
	}
	
	mysql::config::innodb_performance { "2500m_inno_p":
		buffer_pool_size			=> '1800M',
	}
	
	mysql::config::performance { "2500m_performance" : 
		table_cache					=> 2500,
		query_cache_size			=> '400M',
	}
}