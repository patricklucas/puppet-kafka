class kafka(
  $version       = $kafka::params::version,
  $scala_version = $kafka::params::scala_version,
) inherits kafka::params {

  validate_string($version)
  validate_string($scala_version)

  if versioncmp($version, '0.8.2') < 0 {
    fail('This module only supports Kafka >= 0.8.2')
  }

  include kafka::install

}
