class confluent_kafka::server::service {

  case $confluent_kafka::server::enable {
    true: {
      $ensure = 'running'
      $enable = true
    }
    default: {
      $ensure = 'stopped'
      $enable = false
    }
  }

  service { 'kafka':
    ensure  => $ensure,
    enable  => $enable,
    require => [
      Class['confluent_kafka::install'],
      Class['confluent_kafka::server::config'],
    ],
  }

}
