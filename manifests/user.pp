class confluent_kafka::user {

  group { 'kafka':
    ensure => present,
    system => true,
  } ->
  user { 'kafka':
    ensure  => present,
    gid     => 'kafka',
    comment => 'Apache Kafka',
    shell   => '/bin/false',
    system  => true,
  } ->
  limits::limits { 'kafka_nofile':
    ensure     => present,
    user       => 'kafka',
    limit_type => 'nofile',
    both       => 65535,
  }

}
