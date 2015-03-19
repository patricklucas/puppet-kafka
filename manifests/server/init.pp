class kafka::server(

  $service_enable                      = $kafka::server::params::service_enable,
  $service_ensure                      = $kafka::server::params::service_ensure,

  $brokers                             = $kafka::server::params::brokers,
  $log_dirs                            = $kafka::server::params::log_dirs,

  $zookeeper_hosts                     = $kafka::server::params::zookeeper_hosts,
  $zookeeper_connection_timeout_ms     = $kafka::server::params::zookeeper_connection_timeout_ms,
  $zookeeper_session_timeout_ms        = $kafka::server::params::zookeeper_session_timeout_ms,

  $zookeeper_chroot                    = $kafka::server::params::zookeeper_chroot,

  $java_home                           = $kafka::server::params::java_home,
  $java_opts                           = $kafka::server::params::java_opts,
  $classpath                           = $kafka::server::params::classpath,
  $jmx_port                            = $kafka::server::params::jmx_port,
  $heap_opts                           = $kafka::server::params::heap_opts,
  $nofiles_ulimit                      = $kafka::server::params::nofiles_ulimit,

  $auto_create_topics_enable           = $kafka::server::params::auto_create_topics_enable,

  $num_partitions                      = size($log_dirs),
  $default_replication_factor          = $kafka::server::params::default_replication_factor,
  $replica_lag_time_max_ms             = $kafka::server::params::replica_lag_time_max_ms,
  $replica_lag_max_messages            = $kafka::server::params::replica_lag_max_messages,
  $replica_socket_timeout_ms           = $kafka::server::params::replica_socket_timeout_ms,
  $replica_socket_receive_buffer_bytes = $kafka::server::params::replica_socket_receive_buffer_bytes,
  $num_replica_fetchers                = $kafka::server::params::num_replica_fetchers,
  $replica_fetch_max_bytes             = $kafka::server::params::replica_fetch_max_bytes,

  $num_network_threads                 = $kafka::server::params::num_network_threads,
  $num_io_threads                      = size($log_dirs),
  $socket_send_buffer_bytes            = $kafka::server::params::socket_send_buffer_bytes,
  $socket_receive_buffer_bytes         = $kafka::server::params::socket_receive_buffer_bytes,
  $socket_request_max_bytes            = $kafka::server::params::socket_request_max_bytes,

  $log_flush_interval_messages         = $kafka::server::params::log_flush_interval_messages,
  $log_flush_interval_ms               = $kafka::server::params::log_flush_interval_ms,
  $log_retention_hours                 = $kafka::server::params::log_retention_hours,
  $log_retention_bytes                 = $kafka::server::params::log_retention_bytes,
  $log_segment_bytes                   = $kafka::server::params::log_segment_bytes,

  $log_cleanup_interval_mins           = $kafka::server::params::log_cleanup_interval_mins,
  $log_cleanup_policy                  = $kafka::server::params::log_cleanup_policy,

  $metrics_properties                  = $kafka::server::params::metrics_properties,
  $kafka_log_directory                 = $kafka::server::params::kafka_log_directory,
  $jvm_performance_opts                = $kafka::server::params::jvm_performance_opts,

) inherits kafka::server::params {

  validate_re($service_enable, '^(true|false)$')

  validate_re($service_ensure, '^(running|stopped)$')

  validate_hash($brokers)
  if empty($brokers) {
    fail('brokers must not be empty')
  }

  validate_array($log_dirs)
  if empty($log_dirs) {
    fail('log_dirs must not be empty')
  }

  validate_array($zookeeper_hosts)
  if empty($zookeeper_hosts) {
    fail('zookeeper_hosts must not be empty')
  }

  if $zookeeper_connection_timeout_ms and !is_integer($zookeeper_connection_timeout_ms) {
    fail('zookeeper_connection_timeout_ms must be an integer')
  }

  if $zookeeper_session_timeout_ms and !is_integer($zookeeper_session_timeout_ms) {
    fail('zookeeper_session_timeout_ms must be an integer')
  }

  validate_string($zookeeper_chroot)

  if $java_home {
    validate_string($java_home)
  }

  if $java_opts {
    validate_string($java_opts)
  }

  if $classpath {
    validate_string($classpath)
  }

  if $jmx_port and !is_integer($jmx_port) {
    fail('jmx_port must be an integer')
  }

  if $heap_opts {
    validate_string($heap_opts)
  }

  if $nofiles_ulimit and !is_integer($nofiles_ulimit) {
    fail('nofiles_ulimit must be an integer')
  }

  validate_bool($auto_create_topics_enable)

  if $num_partitions and !is_integer($num_partitions) {
    fail('num_partitions must be an integer')
  }

  # XXX
  if $foo and !is_integer($foo) {
    fail('foo must be an integer')
  }

  if $default_replication_factor and !is_integer($default_replication_factor) {
    fail('default_replication_factor must be an integer')
  }

  if $replica_lag_time_max_ms and !is_integer($replica_lag_time_max_ms) {
    fail('replica_lag_time_max_ms must be an integer')
  }

  if $replica_lag_max_messages and !is_integer($replica_lag_max_messages) {
    fail('replica_lag_max_messages must be an integer')
  }

  if $replica_socket_timeout_ms and !is_integer($replica_socket_timeout_ms) {
    fail('replica_socket_timeout_ms must be an integer')
  }

  if $replica_socket_receive_buffer_bytes and !is_integer($replica_socket_receive_buffer_bytes) {
    fail('replica_socket_receive_buffer_bytes must be an integer')
  }

  if $num_replica_fetchers and !is_integer($num_replica_fetchers) {
    fail('num_replica_fetchers must be an integer')
  }

  if $replica_fetch_max_bytes and !is_integer($replica_fetch_max_bytes) {
    fail('replica_fetch_max_bytes must be an integer')
  }

  if $num_network_threads and !is_integer($num_network_threads) {
    fail('num_network_threads must be an integer')
  }

  if $num_io_threads and !is_integer($num_io_threads) {
    fail('num_io_threads must be an integer')
  }

  if $socket_send_buffer_bytes and !is_integer($socket_send_buffer_bytes) {
    fail('socket_send_buffer_bytes must be an integer')
  }

  if $socket_receive_buffer_bytes and !is_integer($socket_receive_buffer_bytes) {
    fail('socket_receive_buffer_bytes must be an integer')
  }

  if $socket_request_max_bytes and !is_integer($socket_request_max_bytes) {
    fail('socket_request_max_bytes must be an integer')
  }

  if $log_flush_interval_messages and !is_integer($log_flush_interval_messages) {
    fail('log_flush_interval_messages must be an integer')
  }

  if $log_flush_interval_ms and !is_integer($log_flush_interval_ms) {
    fail('log_flush_interval_ms must be an integer')
  }

  if $log_retention_hours and !is_integer($log_retention_hours) {
    fail('log_retention_hours must be an integer')
  }

  if $log_retention_bytes and !is_integer($log_retention_bytes) {
    fail('log_retention_bytes must be an integer')
  }

  if $log_segment_bytes and !is_integer($log_segment_bytes) {
    fail('log_segment_bytes must be an integer')
  }

  if $log_cleanup_interval_mins and !is_integer($log_cleanup_interval_mins) {
    fail('log_cleanup_interval_mins must be an integer')
  }

  if $log_cleanup_policy {
    validate_re($log_cleanup_policy, '^(delete|compact)$')
  }

  if $metrics_properties {
    validate_hash($metrics_properties)
  }

  validate_absolute_path($kafka_log_directory)

  if $jvm_performance_opts {
    validate_string($jvm_performance_opts)
  }

  contain kafka::server::config
  contain kafka::server::service

  class { 'kafka::server::service':
    service_enable => $service_enable,
    service_ensure => $service_ensure,
  }

}
