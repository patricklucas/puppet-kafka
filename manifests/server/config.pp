class confluent_kafka::server::config {

  file { '/etc/init/kafka.conf':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
    content => template('confluent_kafka/kafka.conf.erb'),
  }

  file { '/etc/default/kafka':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
    content => template('confluent_kafka/kafka.default.erb'),
  }

  file { '/etc/kafka/server.properties':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
    content => template('confluent_kafka/server.properties.erb'),
  }

  file { '/etc/kafka/log4j.properties':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
    content => template('confluent_kafka/log4j.properties.erb'),
  }

  file { $confluent_kafka::server::log_dirs:
    ensure  => 'directory',
    owner   => 'kafka',
    group   => 'kafka',
    mode    => '0755',
  }

  file { $confluent_kafka::server::kafka_log_directory:
    ensure  => 'directory',
    owner   => 'kafka',
    group   => 'kafka',
    mode    => '0755',
  }

}
