class kafka::server::config(
  $brokers,
  $log_dirs,
  $zookeeper_hosts,
  $zookeeper_connection_timeout_m,
  $zookeeper_session_timeout_ms,
  $zookeeper_chroot,
  $java_home,
  $java_opts,
  $classpath,
  $jmx_port,
  $heap_opts,
  $nofiles_ulimit,
  $auto_create_topics_enable,
  $num_partitions,
  $default_replication_factor,
  $replica_lag_time_max_ms,
  $replica_lag_max_messages,
  $replica_socket_timeout_ms,
  $replica_socket_receive_buffer_bytes,
  $num_replica_fetchers,
  $replica_fetch_max_bytes,
  $num_network_threads,
  $num_io_threads,
  $socket_send_buffer_bytes,
  $socket_receive_buffer_bytes,
  $socket_request_max_bytes,
  $log_flush_interval_messages,
  $log_flush_interval_ms,
  $log_retention_hours,
  $log_retention_bytes,
  $log_segment_bytes,
  $log_cleanup_interval_mins,
  $log_cleanup_policy,
  $metrics_properties,
  $kafka_log_directory,
  $jvm_performance_opts,
) {

  # Get this broker's id and port out of the $kafka::hosts configuration hash
  $broker_id = $brokers[$::fqdn]['id']

  # Using a conditional assignment selector with a
  # Hash value results in a puppet syntax error.
  # Using an if/else instead.
  if ($brokers[$::fqdn]['port']) {
    $broker_port = $brokers[$::fqdn]['port']
  } else {
    $broker_port = 9092
  }

  file { '/etc/default/kafka':
    content => template('kafka/kafka.default.erb'),
  }

  file { '/etc/kafka/server.properties':
    content => template('kafka/server.properties.erb'),
  }

  # This is the message data directory,
  # not to be confused with the $kafka_log_file,
  # which contains daemon process logs.
  file { $log_dirs:
    ensure  => 'directory',
    owner   => 'kafka',
    group   => 'kafka',
    mode    => '0755',
  }

  # log4j configuration for Kafka daemon
  # process logs (this uses $kafka_log_dir).
  file { '/etc/kafka/log4j.properties':
    content => template('kafka/log4j.properties.erb'),
  }

}
