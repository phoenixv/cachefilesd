class cachefilesd::config inherits cachefilesd {
  file { $cachefilesd::params::config:
    ensure  => file,
    path    => $cachefilesd::params::config,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('cachefilesd/cachefilesd.conf.erb'),
  }
}
