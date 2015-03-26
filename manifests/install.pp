class confluent_kafka::install {

  package { 'confluent-kafka':
    ensure => $confluent_kafka::version,
  }

}
