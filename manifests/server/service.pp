class kafka::server::service(
  $service_enable,
  $service_ensure,
) {

  service { 'kafka':
    ensure  => $service_ensure,
    enable  => $service_enable,
    require => Class['kafka::server::config'],
  }

}
