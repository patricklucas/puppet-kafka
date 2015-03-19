class kafka::server::params {

  $service_enable                      = 'true'
  $service_ensure                      = 'running'

  $brokers                             = {},
  $log_dirs                            = ['/var/spool/kafka'],

  $zookeeper_hosts                     = ['localhost:2181']
  $zookeeper_connection_timeout_ms     = 6000
  $zookeeper_session_timeout_ms        = 6000

  $zookeeper_chroot                    = '',

  $java_home                           = undef,
  $java_opts                           = undef,
  $classpath                           = undef,
  $jmx_port                            = 9999,
  $heap_opts                           = undef,
  $nofiles_ulimit                      = 8192,

  $auto_create_topics_enable           = false,

  $num_partitions                      = undef, # set to size($log_dirs) in kafka::server
  $default_replication_factor          = undef,
  $replica_lag_time_max_ms             = undef,
  $replica_lag_max_messages            = undef,
  $replica_socket_timeout_ms           = undef,
  $replica_socket_receive_buffer_bytes = undef,
  $num_replica_fetchers                = undef,
  $replica_fetch_max_bytes             = undef,

  $num_network_threads                 = undef,
  $num_io_threads                      = undef, # set to size($log_dirs) in kafka::server
  $socket_send_buffer_bytes            = undef,
  $socket_receive_buffer_bytes         = undef,
  $socket_request_max_bytes            = undef,

  $log_flush_interval_messages         = undef,
  $log_flush_interval_ms               = undef,
  $log_retention_hours                 = undef,
  $log_retention_bytes                 = undef,
  $log_segment_bytes                   = undef,

  $log_cleanup_interval_mins           = undef,
  $log_cleanup_policy                  = undef,

  $metrics_properties                  = undef,
  $kafka_log_directory                 = '/var/log/kafka',
  $jvm_performance_opts                = undef,

}
