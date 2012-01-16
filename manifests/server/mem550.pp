class mysql::server::mem550 {
	require mysql::server
	
	mysql::config::innodb{ "550m_inno" :
	}
	
	mysql::config::innodb_performance { "550m_inno_p":
		buffer_pool_size			=> '350M',
	}
	
	mysql::config::performance { "550m_performance" : 
		table_cache					=> 2500,
		query_cache					=> '100M',
	}
}