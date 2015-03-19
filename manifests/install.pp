class kafka::install {

  $kafka_package = "confluent-kafka-${kafka::scala_version}"

  package { $kafka_package:
    ensure => $kafka::version,
  }

}
