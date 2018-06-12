class cachefilesd::install inherits cachefilesd {
  package { $cachefilesd::package_name:
    ensure => $cachefilesd::package_ensure,
    name   => $cachefilesd::package_name,
  }
}
