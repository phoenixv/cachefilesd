class cachefilesd::config inherits cachefilesd {
  file { 'cachefilesd_config_file':
    ensure  => file,
    path    => $cachefilesd::params::config,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('cachefilesd/cachefilesd.conf.erb'),
  }

  if $::osfamily == 'Debian' {
    file_line { 'activate cachefilesd':
      path   => '/etc/default/cachefilesd',
      line   => bool2str($cachefilesd::params::activate_cachefilesd, 'RUN=yes', 'RUN=no'),
      match  => 'RUN=',
      notify => Service['cachefilesd'],
    }
  }
}
