class mysql::server::mem1000 {
	require mysql::server
	
	mysql::config::innodb{ "1000m_inno" :
	}
	
	mysql::config::innodb_performance { "1000m_inno_p":
		buffer_pool_size			=> '600M',
	}
	
	mysql::config::performance { "1000m_performance" : 
		table_cache					=> 2500,
		query_cache					=> '250M',
	}
}