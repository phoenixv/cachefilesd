class cachefilesd::service inherits cachefilesd {
  if !($cachefilesd::service_ensure in ['running', 'stopped']) {
    fail('service_ensure parameter must be running or stopped')
  }

  if $cachefilesd::service_manage == true {
    service { $cachefilesd::service_name:
      ensure     => $cachefilesd::service_ensure,
      enable     => $cachefilesd::service_enable,
      name       => $cachefilesd::service_name,
      hasstatus  => true,
      hasrestart => true,
    }
  }

}
