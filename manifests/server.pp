class confluent_kafka::server(

  $enable                              = $confluent_kafka::server::params::enable,

  # Essential Kafka configuration
  $broker_id                           = $confluent_kafka::server::params::broker_id,
  $log_dirs                            = $confluent_kafka::server::params::log_dirs,
  $zookeeper_connect                   = $confluent_kafka::server::params::zookeeper_connect,

  # Other Kafka configuration
  $server_properties                   = $confluent_kafka::server::params::server_properties,

  # Operational configuration
  $java_home                           = $confluent_kafka::server::params::java_home,
  $heap_opts                           = $confluent_kafka::server::params::heap_opts,
  $gc_log_enabled                      = $confluent_kafka::server::params::gc_log_enabled,
  $jmx_port                            = $confluent_kafka::server::params::jmx_port,
  $classpath                           = $confluent_kafka::server::params::classpath,
  $kafka_log_directory                 = $confluent_kafka::server::params::kafka_log_directory,

) inherits confluent_kafka::server::params {

  validate_bool($enable)

  if !is_integer($broker_id) or $broker_id < 0 or $broker_id > 2147483647 {
    fail('broker_id must be an integer between 0 and 2147483647')
  }

  validate_array($log_dirs)
  if empty($log_dirs) {
    fail('log_dirs must not be empty')
  }

  validate_string($zookeeper_connect)
  if empty($zookeeper_connect) {
    fail('zookeeper_connect must not be empty')
  }

  validate_hash($server_properties)

  if $java_home {
    validate_string($java_home)
  }

  if $heap_opts {
    validate_string($heap_opts)
  }

  if $gc_log_enabled {
    validate_bool($gc_log_enabled)
  }

  if $jmx_port and !is_integer($jmx_port) {
    fail('jmx_port must be a port number between 1 and 65535')
  }

  if $classpath {
    validate_string($classpath)
  }

  validate_absolute_path($kafka_log_directory)

  include confluent_kafka::user

  contain confluent_kafka::server::config
  contain confluent_kafka::server::service

  Class['confluent_kafka::install'] -> Class['confluent_kafka::server::config']

}
