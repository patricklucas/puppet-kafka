class confluent_kafka(
  $version = $confluent_kafka::params::version,
) inherits confluent_kafka::params {

  validate_string($version)

  if versioncmp($version, '0.8.2') < 0 {
    fail('This module only supports Kafka >= 0.8.2')
  }

  contain confluent_kafka::install

}
